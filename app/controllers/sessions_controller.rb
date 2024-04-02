class SessionsController < ApplicationController
  def new; end

  def create
    respond_to do |format|
      @user = User.authenticate_by(email: params[:email], password: params[:password])
      if @user
        login @user
        format.html { redirect_to root_path, notice: 'You have signed in successfully.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash_error_now('Login failed! Invalid email or password.')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'You have been logged out!.'
  end
end

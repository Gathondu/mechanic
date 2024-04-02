class RegistrationsController < ApplicationController
  def new
    @user = User.new(type: params[:type])
  end

  def create
    @user = User.new({ type: params[:type], **registration_params })
    respond_to do |format|
      if @user.save
        format.html do
          redirect_to controller: 'users', action: 'show', id: @user,
                      notice: "#{params[:type]} was successfully created."
        end
        format.json { render :show, status: :created, location: @user }
      else
        flash_errors_now(@user.errors)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def registration_params
    params.require(params[:type].downcase.to_sym).permit(:email, :password, :password_confirmation)
  end
end

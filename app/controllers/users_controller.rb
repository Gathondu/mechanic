class UsersController < ApplicationController
  before_action :set_user, except: %i[index employees]

  def index
    redirect_to root_url, alert: 'Not allowed.' unless user_is_admin?

    @users = User.all
  end

  def employees
    redirect_to root_url, alert: 'Not allowed.' unless user_is_admin?

    @users = current_user.employees
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url, notice: "#{@user.type} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        flash_errors_now(@user.errors)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!
    logout

    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{user_type} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,
                                 :country_code, :phone_number)
  end
end

class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit; end

  def update
    if current_user.update(password_params)
      @path = update_redirect_path
      logout
      redirect_to @path, notice: 'Your password has been updated successfully.'
    else
      flash_errors_now(current_user.errors)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(current_user.class.name.downcase).permit(
      :password,
      :password_confirmation,
      :password_challenge
    ).with_defaults(password_challenge: '')
  end

  def update_redirect_path
    user_is_customer? ? customer_login_path : admin_login_path
  end
end

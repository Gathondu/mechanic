class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    redirect_to root_path, alert: 'You must be logged in.' unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def user_is_customer?
    user_signed_in?
    current_user.type == 'Customer'
  end
  helper_method :user_is_customer?

  def user_is_admin?
    user_signed_in?
    current_user.type == 'Admin'
  end
  helper_method :user_is_admin?

  def user_is_employee?
    user_signed_in?
    current_user.type == 'Employee'
  end
  helper_method :user_is_employee?

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout
    Current.user = nil
    reset_session
  end

  def flash_error(error)
    flash[:error] = error
  end
  helper_method :flash_error

  def flash_error_now(error)
    flash.now[:error] = error
  end
  helper_method :flash_error_now

  def flash_errors(errors)
    errors.each { |error| flash[:error] = error.full_message }
  end
  helper_method :flash_errors

  def flash_errors_now(errors)
    errors.each { |error| flash.now[:error] = error.full_message }
  end
  helper_method :flash_errors_now
end

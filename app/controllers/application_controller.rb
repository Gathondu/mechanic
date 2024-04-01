class ApplicationController < ActionController::Base
  private

  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by_id(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def customer?
    user_signed_in?
    current_user.type == 'Customer'
  end
  helper_method :customer?

  def admin?
    user_signed_in?
    current_user.type == 'Admin'
  end
  helper_method :admin?

  def employee?
    user_signed_in?
    current_user.type == 'Employee'
  end
  helper_method :employee?

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout
    Current.user = nil
    reset_session
  end

  def flash_errors(errors)
    errors.each { |error| flash[:error] = error.full_message }
  end
  helper_method :flash_errors

  def flash_errors_now(errors)
    errors.each { |error| flash.now[:error] = error.full_message }
  end
end

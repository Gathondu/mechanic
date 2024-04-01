class ApplicationController < ActionController::Base
  add_flash_types :error

  private

  def flash_errors(errors)
    errors.each { |error| flash[:error] = error.full_message }
  end

  def flash_errors_now(errors)
    errors.each { |error| flash.now[:error] = error.full_message }
  end
end

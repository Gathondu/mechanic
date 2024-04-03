module PasswordsHelper
  def user_type
    # using this for now to parse the user type param sent via url to avoid the amp; appended to the param
    # This is until we set up the mailer
    CGI.parse(URI.parse(request.url).query).fetch('type').first
  end
end

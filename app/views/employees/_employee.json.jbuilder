json.extract! user, :id, :type, :first_name, :last_name, :username, :email, :country_code, :phone_number, :role, :created_at, :updated_at
json.url user_url(user, format: :json)

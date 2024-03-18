json.extract! service, :id, :status, :start_time, :duration, :type, :description, :cost, :car_id, :user_id, :created_at, :updated_at
json.url service_url(service, format: :json)

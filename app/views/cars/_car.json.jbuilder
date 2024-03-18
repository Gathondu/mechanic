json.extract! car, :id, :make, :model, :year_of_manufactuer, :vin, :registration, :mileage, :odometer_type, :customer_id, :created_at, :updated_at
json.url car_url(car, format: :json)

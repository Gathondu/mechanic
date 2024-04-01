# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_401_100_028) do # rubocop:disable Metrics/BlockLength
  create_table 'cars', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'make'
    t.string 'model'
    t.string 'year_of_manufactuer'
    t.string 'vin'
    t.string 'registration'
    t.string 'mileage'
    t.integer 'odometer_type'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_cars_on_user_id'
  end

  create_table 'services', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'status'
    t.datetime 'start_time'
    t.string 'duration'
    t.integer 'service_type'
    t.text 'description'
    t.decimal 'cost', precision: 10, scale: 2
    t.bigint 'car_id', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['car_id'], name: 'index_services_on_car_id'
    t.index ['user_id'], name: 'index_services_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'type'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'username'
    t.string 'email'
    t.string 'country_code'
    t.string 'phone_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'manager_id'
    t.string 'password_digest'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['manager_id'], name: 'index_users_on_manager_id'
  end

  add_foreign_key 'cars', 'users'
  add_foreign_key 'services', 'cars'
  add_foreign_key 'services', 'users'
  add_foreign_key 'users', 'users', column: 'manager_id'
end

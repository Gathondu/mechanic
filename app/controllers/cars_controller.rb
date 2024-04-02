class CarsController < ApplicationController
  before_action :set_customer, only: %i[index new create]
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = @customer.cars
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = @customer.cars.build(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to customer_cars_url(@customer), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        flash_errors_now(@car.errors)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        flash_errors_now(@car.errors)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer_id = @car.customer_id
    @car.destroy!

    respond_to do |format|
      format.html { redirect_to customer_cars_url(@customer_id), notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:make, :model, :year_of_manufactuer, :vin, :registration, :mileage, :odometer_type)
  end
end

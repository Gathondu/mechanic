class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update create destroy]
  def index
    @cars = current_user.cars
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = current_user.cars.build(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: 'Car was successfully created.' }
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
        format.html { redirect_to car_path, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        flash_errors_now(@car.errors)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy!

    respond_to do |format|
      format.html { redirect_to cars_path, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year_of_manufactuer, :vin, :registration, :mileage, :odometer_type)
  end
end

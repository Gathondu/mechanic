class ServicesController < ApplicationController
  before_action :set_car, only: %i[index new create]
  before_action :set_service, only: %i[show edit update destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = @car.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to car_services_path(@car), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update({ car_id: @service.car_id, **service_params })
        format.html { redirect_to service_url(@service), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car_id = @service.car_id
    @service.destroy!

    respond_to do |format|
      format.html { redirect_to car_services_path(@car_id), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:service).permit(:status, :start_time, :duration, :service_type, :description, :cost)
  end
end
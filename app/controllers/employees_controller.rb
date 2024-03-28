class EmployeesController < ApplicationController
  before_action :set_admin, only: %i[index new create]
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = @admin.employees
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = @admin.employees.build(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html do
        redirect_to admin_employees_url(@employee.manager_id), notice: 'Employee was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:type, :first_name, :last_name, :username, :email,
                                     :country_code, :phone_number)
  end
end

class UsersController < ApplicationController
  before_action :set_user, except: :index

  def index
    @users = user_type.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to action: 'show', id: @user, notice: "#{user_type} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        flash_errors_now(@user.errors)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{user_type} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_type
    params[:type].constantize if params[:type].in? User::TYPE_NAMES
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(params[:type].downcase.to_sym).permit(:first_name, :last_name, :username, :email,
                                                         :country_code, :phone_number)
  end
end

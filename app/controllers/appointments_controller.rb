class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_pet, only: [:new]
  skip_before_action :authenticate_user!
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @appointments = Appointment.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @pet = Pet.find(params[:pet_id])
    @appointment.pet = @pet
    @appointment.vet = Vet.find(3)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to root_path unless @appointment.pet.user == current_user
  end

  def update
    @appointment.update(appointment_params)
    redirect_to appointments_path
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def devise_controller
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :title, :description)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end

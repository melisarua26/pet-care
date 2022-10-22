class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      redirect_to pet_path(@appointment)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @appointment.user == current_user
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to pet_path(@appointment)
  end

  def destroy
    @appointment.destroy
    redirect_to pets_path
  end

  private

  def appointmen_params
    params.require(:appointment).permit(:date, vet[:id])
  end

  def set_pet
    @appointment = Appointment.find(params[:id])
  end
end

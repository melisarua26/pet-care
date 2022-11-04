class OwnerRecordsController < ApplicationController
  before_action :set_owner_record, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  def index
    @owner_record = OwnerRecord.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @owner_record = OwnerRecord.new
  end

  def show
    @owner_record = OwnerRecord.find(params[:id])
  end

  def create
    @owner_record = OwnerRecord.new(owner_record_params)
    @pet = Pet.find(params[:pet_id])
    @owner_record.pet = @pet
    if @owner_record.save!
      redirect_to owner_record_path(@owner_record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to pet_owner_records unless @owner_record.pet.user == current_user
  end

  def update
    @owner_record = OwnerRecord.find(params[:id])
    @owner_record.update(owner_record_params)
    redirect_to owner_record_path(@owner_record)
  end

  def destroy
    @owner_record.destroy
    redirect_to owner_records_path
  end

  private

  def owner_record_params
    params.require(:owner_record).permit(:description, :title, :date, :photo)
  end

  def set_owner_record
    @owner_record = OwnerRecord.find(params[:id])
  end

end

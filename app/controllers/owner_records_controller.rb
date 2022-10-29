class OwnerRecordsController < ApplicationController
  before_action :set_owner_record
  skip_before_action :authenticate_user!
  
  def index
    @owner_records = OwnerRecord.all
  end

  def new
    @owner_record = OwnerRecord.new
  end

  def show
    @owner_record = OwnerRecord.find(params[:id])
  end

  def create
    @owner_record = OwnerRecord.new(owner_record_params)
    @owner_record.user = current_user
    if @owner_record.save
      redirect_to new_owner_record_path(@owner_record)
    else
      render :new
    end
  end

  def edit
    redirect_to owner_record_index unless @owner_record.user == current_user
  end

  def update
    @owner_record = OwnerRecord.find(params[:id])
    @owner_record.update(owner_record_params)
    redirect_to pet_path(@owner_record)
  end

  def destroy
    @owner_record.destroy
    redirect_to owner_records_path
  end

  def devise_controller
  end

  private

  def owner_record_params
    params.require(:owner_record).permit(:description, :type, :date, :photo)
  end

  def set_owner_record
    @owner_record = OwnerRecord.find(params[:id])
  end

end

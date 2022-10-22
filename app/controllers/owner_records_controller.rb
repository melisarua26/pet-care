class OwnerRecordsController < ApplicationController

  def index
    @o_records = OwnerRecord.all
  end

  def new
    @o_record = OwnerRecord.new
  end

  def show
    @o_record = OwnerRecord.find(params[:id])
  end

  def create
    @owner_record = OwnerRecord.new(pet_params)
    @owner_record.user = current_user
    if @owner_record.save
      redirect_to owner_record_index(@o_record)
    else
      render :new
    end
  end

  def edit
    redirect_to owner_record_index unless @owner_record.user == current_user
  end

  def update
    @owner_record = OwnerRecord.find(params[:id])
    @owner_record.update(place_params)
    redirect_to pet_path(@owner_record)
  end

  def destroy
    @owner_record.destroy
    redirect_to owner_records_path
  end

  private

  def owner_record_params
    params.require(:o_record).permit(:description, :type, :date, :photo)
  end

  def set_place
    @owner_record = OwnerRecord.find(params[:id])
  end

end

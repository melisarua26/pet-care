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
    @o_record = OwnerRecord.new(pet_params)
    @o_record.user = current_user
    if @o_record.save
      redirect_to owner_record_index(@o_record)
    else
      render :new
    end
  end

  def edit
    redirect_to owner_record_index unless @o_record.user == current_user
  end

  def update
    @o_record = OwnerRecord.find(params[:id])
    @o_record.update(place_params)
    redirect_to pet_path(@o_record)
  end

  def destroy
    @pet.destroy
    redirect_to owner_records_path
  end

  private

  def owner_record_params
    params.require(:o_record).permit(:description, :type, :date, :photo)
  end

  def set_place
    @o_record = OwnerRecord.find(params[:id])
  end

end

class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @pet.user == current_user
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(place_params)
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :gender, :birthdate, :specie, :breed, :photo)
  end

  def set_place
    @pets = Pet.find(params[:id])
  end
end

class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  def index
    @pets = Pet.all.map { |pet| pet if pet.user == current_user }.compact
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
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  def devise_controller
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :gender, :birthdate, :specie, :breed, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end

class Pet < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :owner_records
  has_many :vets, through: :appointments
  has_one_attached :photo

  validates :name, :gender, :birthdate, :specie, :breed, presence: true
end

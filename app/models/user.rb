class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entrances
  has_many :exits
  has_one_attached :photo
  validates :first_name, :last_name, :employee_number, :shift, presence: true
  validates :employee_number, numericality: { only_integer: true }, uniqueness: true

  SHIFTS = ["Matutino", "Vespertino", "No aplica"].freeze



end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entrances
  has_many :exits
  validates :first_name, :last_name, :employee_number, :shift, :admin, presence: true
  validates :employee_number, numericality: { only_integer: true }
end

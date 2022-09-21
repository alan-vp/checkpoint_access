class User < ApplicationRecord
  has_many :entrances, dependent: :destroy
  has_many :exits, dependent: :destroy
end

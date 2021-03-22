class Flock < ApplicationRecord
  has_many :chickens
  has_and_belongs_to_many :users
end

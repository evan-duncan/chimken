class Chicken < ApplicationRecord
  belongs_to :breed
  belongs_to :flock
end

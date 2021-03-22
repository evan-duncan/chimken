class ChickenBelongsToFlock < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :chickens, :flock, foreign_key: true
  end
end

class CreateChickens < ActiveRecord::Migration[6.0]
  def change
    create_table :chickens do |t|
      t.belongs_to :breed, null: false, foreign_key: true
      t.string :name
      t.date :born_at

      t.timestamps
    end
  end
end

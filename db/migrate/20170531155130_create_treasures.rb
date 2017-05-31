class CreateTreasures < ActiveRecord::Migration[5.0]
  def change
    create_table :treasures do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

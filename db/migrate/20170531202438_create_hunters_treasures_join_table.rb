class CreateHuntersTreasuresJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hunters_treasures, id: false do |t|
      t.integer :hunter_id
      t.integer :treasure_id
    end
  end
end

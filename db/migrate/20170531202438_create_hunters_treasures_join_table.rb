class CreateHuntersTreasuresJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hunters_treasures, id: false do |t|
      t.integer :hunter_id, :null => false, foreign_key: true
      t.integer :treasure_id, foreign_key: true
    end

    add_index(:hunters_treasures, [:hunter_id, :treasure_id])
  end

end

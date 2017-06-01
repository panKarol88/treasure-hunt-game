class CreateHuntersTreasuresJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hunters_treasures, id: false do |t|
      t.integer :hunter_id, :null => false
      t.integer :treasure_id, :null => false
    end
    
    add_index(:hunters_treasures, [:hunter_id, :treasure_id], :unique => true)
  end

end

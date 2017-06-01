class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :hunter, foreign_key: true
      t.references :treasure, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

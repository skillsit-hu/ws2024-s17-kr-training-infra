class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end

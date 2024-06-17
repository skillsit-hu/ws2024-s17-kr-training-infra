class CreateRoomUnavailableTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_unavailable_times do |t|
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.time :from
      t.time :to
      t.boolean :fullday, default: false

      t.timestamps
    end
  end
end

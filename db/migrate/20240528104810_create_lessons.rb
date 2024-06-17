class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end

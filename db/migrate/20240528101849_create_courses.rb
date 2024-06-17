class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :state, default: "draft"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

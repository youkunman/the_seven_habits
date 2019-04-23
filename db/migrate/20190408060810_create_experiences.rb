class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.integer :habit_id
      t.integer :user_id
      t.datetime :created_at

      t.timestamps
    end
  end
end

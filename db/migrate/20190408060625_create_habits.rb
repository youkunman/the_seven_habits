class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.integer :user_id
      t.string :habit_name

      t.timestamps
    end
  end
end

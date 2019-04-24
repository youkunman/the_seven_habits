class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.string :habit_name

      t.timestamps
    end
  end
end

class AddHobbyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hobby, :string
  end
end

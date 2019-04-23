class RemoveIndexEmailFromUsers < ActiveRecord::Migration[5.2]
  def change
  end

  def up
    remove_index :users, :email
  end

  def down
    add_index :users, :email, unique: true
  end

end

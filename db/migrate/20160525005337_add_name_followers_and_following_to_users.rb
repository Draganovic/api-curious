class AddNameFollowersAndFollowingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :following, :integer
    add_column :users, :followers, :integer
  end
end

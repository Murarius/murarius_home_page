class AddRememberTokenToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :remember_token, :string
  end
end

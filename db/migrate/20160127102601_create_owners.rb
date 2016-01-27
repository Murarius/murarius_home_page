# class CreateOwners < ActiveRecord::Migration
class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :login
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

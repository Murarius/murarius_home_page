class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :thumb, null: false
      t.string :when_created, null: false
      t.string :description, null: false
      t.string :github_link
      t.string :demo_link

      t.timestamps null: false
    end
  end
end

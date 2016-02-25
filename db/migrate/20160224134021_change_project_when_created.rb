class ChangeProjectWhenCreated < ActiveRecord::Migration
  def change
    # Add the new column.
    add_column :projects, :when_created_tmp, :date

    Project.all.each do |project|
      project.update_attribute(:when_created_tmp, Time.zone.now)
    end

    remove_column :projects, :when_created
    rename_column :projects, :when_created_tmp, :when_created
    change_column :projects, :when_created, :date, null: false
  end
end

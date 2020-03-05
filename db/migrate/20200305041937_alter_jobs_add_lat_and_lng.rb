class AlterJobsAddLatAndLng < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :latitude, :float
    add_column :jobs, :longitude, :float
  end
end

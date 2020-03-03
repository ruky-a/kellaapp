class AddCategoryIndexToJobs < ActiveRecord::Migration[6.0]
  def change
     add_reference :jobs, :category, index: true
  end
end

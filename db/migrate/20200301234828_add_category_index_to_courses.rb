class AddCategoryIndexToCourses < ActiveRecord::Migration[6.0]
  def change
        add_reference :courses, :category, index: true
  end
end

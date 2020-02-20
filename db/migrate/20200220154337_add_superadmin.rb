class AddSuperadmin < ActiveRecord::Migration[6.0]
  def change
     User.create! do |u|
        u.email     = 'admin@kellaapp.com'
        u.password  = 'coding'
        u.superadmin_role = true
    end
  end
end

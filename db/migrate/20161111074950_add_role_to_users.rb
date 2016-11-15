class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :comment=>"用户角色"
  end
end

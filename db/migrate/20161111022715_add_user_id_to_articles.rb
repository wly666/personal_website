class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer, :comment=>"用户id"
  end
end

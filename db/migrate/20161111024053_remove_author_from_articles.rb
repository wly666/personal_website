class RemoveAuthorFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :author, :string, :comment=>"删除作者列，作者默认为当前登录用户"
  end
end

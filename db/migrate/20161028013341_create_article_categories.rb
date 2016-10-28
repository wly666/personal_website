class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories,comment:"文章分类表" do |t|
      t.string :name,comment:"分类名称"
      t.timestamps
    end
  end
end


class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, comment:"文章" do |t|
      t.string :title, comment:"文章标题"
      t.string :author, comment:"文章作者"
      t.string :content, comment:"文章内容"
      t.belongs_to :article_category, comment:"与文章分类表关联"
      t.timestamps
    end
  end
end

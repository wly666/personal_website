class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, comment:"文章" do |t|
      t.string :title, comment:"文章标题, 例如： 《缓存的使用》"
      t.string :author, comment:"文章作者, 例如： 王同学"
      t.string :content, comment:"文章内容, 例如：<div>lalala</div>"
      t.belongs_to :article_category, comment:"与文章分类表关联"
      t.timestamps
    end
  end
end

class CreateCartograms < ActiveRecord::Migration
  def change
    create_table :cartograms, comment:"所有文章每天的点击量统计"  do |t|
      t.integer :amount, comment:"所有文章的点击量"
      t.date :date, comment:"文章点击的时间"
    end
  end
end

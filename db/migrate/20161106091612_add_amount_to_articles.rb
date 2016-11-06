class AddAmountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :amount, :integer
  end
end

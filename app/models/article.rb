class Article <ActiveRecord::Base
  belongs_to :article_category

  def self.tongji
    @x_axis = Cartogram.all.map{ |cartogram|  "'#{cartogram.date}'" }.join(',')
    @daily_pvs = Cartogram.all.map { |cartogram| cartogram.amount }.join(',')
    {:x => @x_axis, :y => @daily_pvs}
  end
end

class Article <ActiveRecord::Base
  belongs_to :article_category
  belongs_to :user

  mount_uploader :file_path, FileUploader

  def self.tongji
    @x_axis = Cartogram.all.map{ |cartogram|  "'#{cartogram.date}'" }.join(',')
    @daily_pvs = Cartogram.all.map { |cartogram| cartogram.amount }.join(',')
    {
      :x => @x_axis,
      :y => @daily_pvs
    }
  end
end

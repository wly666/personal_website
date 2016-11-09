class ArticlesController <ApplicationController

  before_action :update_amount, :only=>[:show]

  def index
    @articles = Article.where(:article_category_id=>params[:article_category_id]).page(params[:page]).per(10)
  end

  def new
    @article = Article.new(:article_category_id=>params[:article_category_id])
  end

  def create
    Article.create :title=>params[:article][:title],
      :content=>params[:article][:content],
      :author=>params[:article][:author],
      :article_category_id=>params[:article][:article_category_id],
      :file_path=>params[:article][:file_path]
    redirect_to articles_path(:article_category_id=>params[:article][:article_category_id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.author = params[:article][:author]
    @article.save
    redirect_to articles_path(:article_category_id=>params[:article][:article_category_id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path(:article_category_id=>params[:article_category_id])
  end

  def show
    @article_categories = ArticleCategory.all
    @article = Article.joins(:article_category).find(params[:id])
    @article_category_id = @article.article_category_id
    if @article.amount == nil
      @article.amount=0
    else
      @article.amount = @article.amount + 1
    end
    @article.save!
    render :layout=>"main_application"
  end

  def main_index
    @article_categories = ArticleCategory.all
    @articles = Article.where(:article_category_id=>params[:article_category_id]).page(params[:page]).per(10)
    @articles = @articles.where("title like '%#{params[:title]}%'") if params[:title].present?
    render :layout=>"main_application"
  end

  def cartogram
    # 这里调用Article模型内部的方法tongji. 很好的实现了，将逻辑代码存放到model中，
    # 让controller实现了对 路由动作的专注。
    @x_axis = Article.tongji[:x]
    @daily_pvs = Article.tongji[:y]
  end

  private

  def update_amount
    now_date = Time.now.strftime("%Y-%m-%d")
    @amount = Cartogram.where('date = ? ', now_date ).first
    if @amount.blank?
      @amount = Cartogram.create :date => now_date , :amount => 0
    end
    @amount.amount = @amount.amount + 1
    @amount.save!
  end
end

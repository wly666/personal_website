class ArticlesController <ApplicationController
  def index
    @articles = Article.where(:article_category_id=>params[:article_category_id])
  end

  def new
    @article = Article.new(:article_category_id=>params[:article_category_id])
  end

  def create
    Article.create :title=>params[:article][:title],
                   :content=>params[:article][:content],
                   :author=>params[:article][:author],
                   :article_category_id=>params[:article][:article_category_id]
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
    @article = Article.find(params[:id])
  end
end

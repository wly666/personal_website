class ArticlesController <ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create :title=>params[:article][:title],:content=>params[:article][:content], :author=>params[:article][:author], :created_at=>params[:article][:created_at]
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.author = params[:article][:author]
    @article.updated_at = params[:article][:updated_at]
    @article.save
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path
  end
end

class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.all.page(params[:page]).per(1)
  end

  def new
    @article_category = ArticleCategory.new
  end

  def create
    ArticleCategory.create :name=>params[:article_category][:name]
    redirect_to article_categories_path
  end

  def edit
    @article_category = ArticleCategory.find(params[:id])
  end

  def update
    @article_category = ArticleCategory.find(params[:id])
    @article_category.name = params[:article_category][:name]
    @article_category.save
    redirect_to article_categories_path
  end

  def destroy
    @article_category = ArticleCategory.find(params[:id])
    @article_category.delete
    redirect_to article_categories_path
  end

  def show_index
    @categories = ArticleCategory.all
    #puts "==================#{params[:title]}"
    if params[:title1].present?
      @one_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[0].id).where("title like '%#{params[:title1]}%'")
    else
      @one_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[0].id)
    end
    if params[:title2].present?
      @two_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[1].id).where("title like '%#{params[:title2]}%'")
    else
      @two_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[1].id)
    end
    if params[:title3].present?
      @three_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[2].id).where("title like '%#{params[:title3]}%'")
    else
      @three_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[2].id)
    end
  end
end

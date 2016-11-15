class ArticleCategoriesController < ApplicationController

  before_action :find_article_category_by_id, :only=>[:update, :edit, :destroy]
  before_action :all, :only=>[:index, :main_index, :main_about]
  #load_and_authorize_resource
  before_action :authenticate_user!, except:[:main_index, :main_about]

  def find_article_category_by_id
    @article_category = ArticleCategory.find(params[:id])
  end

  def all
    @article_categories = ArticleCategory.all
  end

  def index
    @article_categories = @article_categories.page(params[:page]).per(10)
  end

  def new
    @article_category =current_user.article_categories.build
    authorize! :create,@article_category
  end

  def create
   current_user.article_categories.create :name=>params[:article_category][:name]
    redirect_to article_categories_path
  end

  def edit
    authorize! :update,@article_category
  end

  def update
    @article_category.name = params[:article_category][:name]
    @article_category.save
    redirect_to article_categories_path
  end

  def destroy
    authorize! :destroy,@article_category
    @article_category.delete
    redirect_to article_categories_path
  end

  def main_index
    render :layout=>"main_application"
  end

  def main_about
    render :layout=>"main_application"
  end

  def show_index
    @categories = ArticleCategory.all

    @one_articles = Article.where(:article_category_id=>@categories[0].id)
    @one_articles = @one_articles.where("title like '%#{params[:title1]}%'") if params[:title1].present?

    @two_articles = Article.where(:article_category_id=>@categories[1].id)
    @two_articles = @two_articles.where("title like '%#{params[:title2]}%'") if params[:title2].present?

    @three_articles = Article.where(:article_category_id=>@categories[2].id)
    @three_articles = @three_articles.where("title like '%#{params[:title3]}%'") if params[:title3].present?

    #def show_index
    #  @categories = ArticleCategory.all
    #  #puts "==================#{params[:title]}"
    #  if params[:title1].present?
    #    @one_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[0].id).where("title like '%#{params[:title1]}%'")
    #  else
    #    @one_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[0].id)
    #  end
    #  if params[:title2].present?
    #    @two_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[1].id).where("title like '%#{params[:title2]}%'")
    #  else
    #    @two_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[1].id)
    #  end
    #  if params[:title3].present?
    #    @three_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[2].id).where("title like '%#{params[:title3]}%'")
    #  else
    #    @three_articles = Article.all.joins(:article_category).where(:article_category_id=>@categories[2].id)
    #  end
  end
end

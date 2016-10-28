class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.all
  end

  def new
    @article_category = ArticleCategory.new
  end

  def create
    ArticleCategory.create :name=>params[:article_category][:name],:created_at=>params[:article_category][:created_at]
    redirect_to article_categories_path
  end

  def edit
    @article_category = ArticleCategory.find(params[:id])
  end

  def update
    @article_category = ArticleCategory.find(params[:id])
    @article_category.name = params[:article_category][:name]
    @article_category.updated_at = params[:article_category][:updated_at]
    @article_category.save
    redirect_to article_categories_path
  end

  def destroy
    @article_category = ArticleCategory.find(params[:id])
    @article_category.delete
    redirect_to article_categories_path
  end
end

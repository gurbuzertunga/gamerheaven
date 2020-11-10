class CategoriesController < ApplicationController
  def index
    @most_voted_article = Article.top_voted_article
  end

  def show
    @category = Category.find(params[:id])
  end
end

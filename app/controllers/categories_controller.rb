class CategoriesController < ApplicationController
  def index
    @most_voted_article = Article.top_voted_article
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      flash.now[:errors] = @category.errors.full_messages
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :importance)
  end
end

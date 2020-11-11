class ArticlesController < ApplicationController
  before_action :require_login, only: %i[create new vote_article unvote_article]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.category_ids = params[:article][:category_ids]

    if @article.save
      redirect_to root_path
    else
      flash.now[:errors] = @article.errors.full_messages
      render 'new'
    end
  end

  def vote_article
    @article = Article.find(params[:id])
    if @article
      @article.vote(current_user.id)
      if @article.save
        redirect_to request.referer
      else
        redirect_to login_path
      end
    else
      redirect_to signup_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def unvote_article
    @article = Article.find(params[:id])
    if @article
      @article.unvote(current_user.id)
      if @article.save
        redirect_to request.referer
      else
        redirect_to login_path
      end
    else
      redirect_to signup_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def require_login
    redirect_to login_path unless current_user
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :picture)
  end
end

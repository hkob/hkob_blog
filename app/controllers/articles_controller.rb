class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = object_from_params_id Article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: notice_message(Article)
    else
      flash.now[:alert] = alert_message Article
      render :new, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end

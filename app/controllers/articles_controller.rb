class ArticlesController < ApplicationController
  before_action :take_one, only: %i[show edit update]
  def index
    @articles = Article.all
  end

  def show
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

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: notice_message(Article)
    else
      flash.now[:alert] = alert_message Article
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def take_one
    @article = object_from_params_id Article
  end
end

# frozen_string_literal: true

# Articles
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :take_one, only: %i[edit update destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = object_from_params_id Article
    @comments = @article.comments.order_created_at_desc
    @comment = objects_from_params(Comment) || @article.comments.build
  end

  def new
    @article = current_user.articles.build
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

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: notice_message(Article)
    else
      flash.now[:alert] = alert_message Article
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: notice_message(Article), status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end

  def take_one
    @article = object_from_params_id Article
    redirect_to root_path, alert: I18n.t("errors.messages.not_owned") unless @article.owned_by?(current_user)
  end
end

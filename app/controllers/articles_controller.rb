class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = object_from_params_id Article
  end
end

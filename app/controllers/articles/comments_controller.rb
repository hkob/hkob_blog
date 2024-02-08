class Articles::CommentsController < ApplicationController
  before_action :take_base
  before_action :take_one, only: %i[update destroy]

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: notice_message(Comment)
    else
      flash.now[:alert] = alert_message Comment
      render "articles/show", status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: notice_message(Comment)
    else
      @comments = @article.comments.order_created_at_desc
      flash.now[:alert] = alert_message Comment
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to @article, notice: notice_message(Comment), status: :see_other
  end

  private

  def take_base
    @article = objects_from_params Article
  end

  def take_one
    @comment = object_from_params_id Comment
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end

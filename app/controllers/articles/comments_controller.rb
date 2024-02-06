class Articles::CommentsController < ApplicationController
  before_action :take_base

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: notice_message(Comment)
    else
      flash.now[:alert] = alert_message Comment
      render "articles/show", status: :unprocessable_entity
    end
  end

  private

  def take_base
    @article = objects_from_params Article
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end

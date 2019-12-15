class CommentsController < ApplicationController

  def new

  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to discussion_path(params[:comment][:discussion_id])
    else
      flash[:errors] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(update_comment_params)
      redirect_to "/discussiontopics"
    else
      flash[:errors] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment,:user_id,:discussion_id)
    end

    def update_comment_params
      params.require(:comment).permit(:comment)
    end
end

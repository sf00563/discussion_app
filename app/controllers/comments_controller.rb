class CommentsController < ApplicationController

  #allows the form on the new page to have access to a comment
  def new
    @comment = Comment.new
  end

  #creates a new comment and stores to model
  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to discussion_path(params[:comment][:discussion_id])
    else
      flash[:errors] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end

  end

  #edits a particular comment
  def edit
    @comment = Comment.find(params[:id])
  end

  #updates a particular comment
  def update
    comment = Comment.find(params[:id])
    if comment.update(update_comment_params)
      redirect_to "/discussiontopics"
    else
      flash[:errors] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  #destroys a particular comment
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  #strong parameters when taking in user input
  private
    def comment_params
      params.require(:comment).permit(:comment,:user_id,:discussion_id)
    end

    def update_comment_params
      params.require(:comment).permit(:comment)
    end
end

class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find(params[:id])
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    discussion = Discussion.find(params[:id])
    if discussion.update(discussion_params)
      redirect_to "/discussiontopics/#{discussion.discussion_topic_id}"
    else
      flash[:errors] = discussion.errors.full_messages
      redirect_to "/discussions/#{discussion.id}/edit"
    end
  end

  private
    def discussion_params
      params.require(:discussion).permit(:title, :content)
    end
end

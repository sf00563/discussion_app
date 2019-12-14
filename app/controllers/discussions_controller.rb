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

  def new

  end

  def create
    discussion = Discussion.new(discussion_params_create)
    if discussion.save
      redirect_to "/discussiontopics/#{params[:discussion][:discussion_topic_id]}"
    else
      flash[:errors] = discussion.errors.full_messages
      redirect_to "/discussions/new/#{params[:discussion][:discussion_topic_id]}"
    end
  end

  private
    def discussion_params
      params.require(:discussion).permit(:title, :content)
    end

    def discussion_params_create
      params.require(:discussion).permit(:title, :content, :user_id, :discussion_topic_id)
    end
end

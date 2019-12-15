class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find(params[:id])
    @comments = Comment.where('discussion_id = ?', params[:id])
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    discussion = Discussion.find(params[:id])
    if discussion.update(discussion_params)
      redirect_to discussiontopics_discussions_path(discussion.discussion_topic_id)
    else
      flash[:errors] = discussion.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @discussion = Discussion.new
  end

  def create
    discussion = Discussion.new(discussion_params_create)
    if discussion.save
      redirect_to discussiontopics_discussions_path(params[:discussion][:discussion_topic_id])
    else
      flash[:errors] = discussion.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    discussion = Discussion.find(params[:id])
    discussion.destroy
    redirect_to "/discussiontopics"
  end

  private
    def discussion_params
      params.require(:discussion).permit(:title, :content)
    end

    def discussion_params_create
      params.require(:discussion).permit(:title, :content, :user_id, :discussion_topic_id)
    end
end

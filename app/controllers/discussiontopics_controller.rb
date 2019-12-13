class DiscussiontopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @discussionTopics = DiscussionTopic.all
  end

  def show
    @discussions = Discussion.where('discussion_topic_id = ?', params[:id])
  end

end

class DiscussiontopicsController < ApplicationController
  before_action :authenticate_user!

  #displays all of the discussion topics to the user
  def index
    @discussionTopics = DiscussionTopic.all
  end

  #shows the discussions relevant to a particular topic
  def show
    @discussions = Discussion.where('discussion_topic_id = ?', params[:id])
  end

end

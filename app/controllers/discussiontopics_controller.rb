class DiscussiontopicsController < ApplicationController
  before_action :authenticate_user!
  def index
    @discussionTopics = DiscussionTopic.all
  end
end

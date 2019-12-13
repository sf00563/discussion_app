class ChangeTopicIdToDiscussionTopicId < ActiveRecord::Migration[5.2]
  def change
    rename_column :discussions, :topic_id, :discussion_topic_id
  end
end

class AddDiscussionTopicIdToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :topic_id, :integer
  end
end

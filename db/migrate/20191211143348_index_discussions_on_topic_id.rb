class IndexDiscussionsOnTopicId < ActiveRecord::Migration[5.2]
  def change
    add_index :discussions, :topic_id
  end
end

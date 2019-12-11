class IndexCommentsOnDiscussionId < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :discussion_id
  end
end

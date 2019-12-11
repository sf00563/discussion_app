class AddDiscussionIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :discussion_id, :integer
  end
end

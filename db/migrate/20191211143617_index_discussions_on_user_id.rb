class IndexDiscussionsOnUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :discussions, :user_id
  end
end

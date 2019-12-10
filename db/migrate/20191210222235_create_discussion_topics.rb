class CreateDiscussionTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_topics do |t|
      t.string :topic

      t.timestamps
    end
  end
end

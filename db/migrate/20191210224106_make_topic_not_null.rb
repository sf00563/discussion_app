class MakeTopicNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :discussion_topics, :topic, false
  end
end

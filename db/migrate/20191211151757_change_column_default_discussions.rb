class ChangeColumnDefaultDiscussions < ActiveRecord::Migration[5.2]
  def change
    change_column_default :discussions, :title, ""
    change_column_default :discussions, :content, ""
  end
end

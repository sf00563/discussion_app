class MakeTitleContentNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :discussions, :title, false
    change_column_null :discussions, :content, false
  end
end

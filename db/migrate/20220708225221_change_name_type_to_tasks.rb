class ChangeNameTypeToTasks < ActiveRecord::Migration[7.0]
  
    def change
      rename_column :tasks, :name, :content
      change_column :tasks, :content, :text
    end

end

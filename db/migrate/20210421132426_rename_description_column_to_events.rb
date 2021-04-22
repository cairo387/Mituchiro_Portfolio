class RenameDescriptionColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :description, :title
  end
end

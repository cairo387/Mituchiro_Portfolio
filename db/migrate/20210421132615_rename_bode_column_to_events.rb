class RenameBodeColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :body, :description
  end
end

class RenameStartDateColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :start_date, :start
  end
end

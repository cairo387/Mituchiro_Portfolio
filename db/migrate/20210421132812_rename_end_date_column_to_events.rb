class RenameEndDateColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :end_date, :end
  end
end

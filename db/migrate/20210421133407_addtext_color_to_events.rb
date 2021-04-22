class AddtextColorToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :textColor, :string
  end
end

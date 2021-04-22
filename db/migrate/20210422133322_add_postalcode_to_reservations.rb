class AddPostalcodeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :postal_code, :string
  end
end

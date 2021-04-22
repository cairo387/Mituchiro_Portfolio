class AddPhonenumbersToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :phone_number, :string
  end
end

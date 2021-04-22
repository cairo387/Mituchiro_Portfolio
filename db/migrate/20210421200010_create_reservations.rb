class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :chiropractor_id
      t.string :name
      t.string :address
      t.string :station

      t.timestamps
    end
  end
end

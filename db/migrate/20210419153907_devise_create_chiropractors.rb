# frozen_string_literal: true

class DeviseCreateChiropractors < ActiveRecord::Migration[5.2]
  def change
    create_table :chiropractors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :treatment_id
      t.string :nickname
      t.string :name
      t.string :postal_code
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :phone_number
      t.string :image_id
      t.integer :fare, default:0
      t.integer :service_charge, default:4000
      t.integer :age
      t.integer :sex, default:2
      t.string :nearest_station
      t.integer :treatment_time, default:30
      t.boolean :chiropractors_status, default:true

      t.timestamps null: false
    end

    add_index :chiropractors, :email,                unique: true
    add_index :chiropractors, :reset_password_token, unique: true
    # add_index :chiropractors, :confirmation_token,   unique: true
    # add_index :chiropractors, :unlock_token,         unique: true
  end
end

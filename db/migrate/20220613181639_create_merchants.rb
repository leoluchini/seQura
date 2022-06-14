# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name, index: true
      t.string :email, index: { unique: true, name: 'merchant_unique_emails' }
      t.string :cif

      t.timestamps
    end
  end
end

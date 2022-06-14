# frozen_string_literal: true

class CreateShoppers < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppers do |t|
      t.string :name, index: true
      t.string :email, index: { unique: true, name: 'shopper_unique_emails' }
      t.string :nif

      t.timestamps
    end
  end
end

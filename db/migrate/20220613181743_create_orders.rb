# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :merchant, foreign_key: true, null: false
      t.references :shopper, foreign_key: true, null: false
      t.float :amount
      t.datetime :completed_at

      t.timestamps
    end
  end
end

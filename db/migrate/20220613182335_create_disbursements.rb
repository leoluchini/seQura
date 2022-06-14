# frozen_string_literal: true

class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :order, foreign_key: true, null: false
      t.float :amount

      t.timestamps
    end
  end
end

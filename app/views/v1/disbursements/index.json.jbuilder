# frozen_string_literal: true

json.collection @disbursements do |disbursement|
  json.extract! disbursement, :id, :amount

  json.order do
    json.extract! disbursement.order, :id, :amount, :completed_at
  end

  json.merchant do
    json.extract! disbursement.merchant, :id, :name, :email, :cif
  end
end

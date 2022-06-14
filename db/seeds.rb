# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

merchant_records = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'merchants.json')))
shopper_records = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'shoppers.json')))
order_records = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'orders.json')))

Merchant.insert_all merchant_records['RECORDS']
Shopper.insert_all shopper_records['RECORDS']
Order.insert_all order_records['RECORDS']

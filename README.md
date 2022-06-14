# README
ecommerce shops (merchants) a flexible payment method so their customers (shoppers) can purchase and receive goods without paying upfront.
A small fee per purchase and pays out (disburse) the merchant once the order is marked as completed.

The operations manager is now asking you to make a system to calculate how much money should be disbursed to each merchant based on the following rules:

- Disbursements are done weekly on Monday.
- We disburse only orders which status is completed.
- The disbursed amount has the following fee per order:
    - 1% fee for amounts smaller than 50 €
    - 0.95% for amounts between 50€ - 300€
    - 0.85% for amounts over 300€

## Ruby version
  `3.0.3`

## How to use

1. Clone this repo
1. Install Sqlite3 in case you don't have it
1. `bundle install`
1. `bundle exec rails db:create db:migrate db:seed`
1. `bundle exec rspec` and make sure all tests pass
1. `bundle exec rails s`
1. You can now try your REST services!

## Gems

- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Faker](https://github.com/stympy/faker) for generating test data
- [Jbuilder](https://github.com/rails/jbuilder) for json views
- [Puma](https://github.com/puma/puma) for the server
- [RSpec](https://github.com/rspec/rspec) for testing
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) adds other testing matchers
- [Sidekiq](https://github.com/mperham/sidekiq) for background jobs
- [Sidekiq-Scheduler](https://github.com/moove-it/sidekiq-scheduler) scheduler jobs
- [Simplecov](https://github.com/colszowka/simplecov) for code coverage

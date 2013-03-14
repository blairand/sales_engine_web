Bundler.require

require 'simplecov'
SimpleCov.start

require './lib/sales_engine_web/server'
require './lib/sales_engine_web/controllers/controller'
require './lib/sales_engine_web/models/finder_methods'
require './lib/sales_engine_web/models/merchant'
require './lib/sales_engine_web/models/invoice'
require './lib/sales_engine_web/models/invoice_item'
require './lib/sales_engine_web/models/item'
require './lib/sales_engine_web/models/customer'
require './lib/sales_engine_web/models/transaction'
require './lib/sales_engine_web/models/database'

SalesEngineWeb::Database.environment = :test

RSpec.configure do |config|
  config.around :each do |example|
    SalesEngineWeb::Database.database.transaction do
      example.run
      raise(Sequel::Rollback)
    end
  end
end

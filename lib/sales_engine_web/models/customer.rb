require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Customer
    attr_reader :id, :first_name, :last_name

    def initialize(params)
      @id           = params[:id]
      @first_name  = params[:first_name]
      @last_name  = params[:last_name]
    end

    def self.create(params)
      new(params).save
    end

    def save
      @id = add(self)
      self
    end

    def self.add(invoice)
      customers.insert(invoice.to_hash)
    end

    def self.customers
      Database.customers
    end
  end
end

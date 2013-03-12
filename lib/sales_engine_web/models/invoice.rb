require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Invoice
    attr_reader :id, :customer_id, :merchant_id, :status

    def initialize(params)
      @id           = params[:id]
      @customer_id  = params[:customer_id]
      @merchant_id  = params[:merchant_id]
      @status       = params[:status]
    end

    def self.create(params)
      Invoice.new(params).save
    end

    def save
      @id = Invoice.add(self)
      self
    end

    def self.add(invoice)
      invoices.insert(invoice.to_hash)
    end

    def self.invoices
      Database.invoices
    end

    def to_hash
      {id: id, customer_id: customer_id, merchant_id: merchant_id, status: status}
    end

    def to_json
      {id: id, customer_id: customer_id, merchant_id: merchant_id, status: status}.to_json
    end

    def self.random
      result = invoices.to_a.sample
      new(result) if result
    end

  end
end


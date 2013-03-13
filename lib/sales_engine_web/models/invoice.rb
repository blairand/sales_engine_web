require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Invoice
    extend FinderMethods
    attr_reader :id, :customer_id, :merchant_id, :status

    def initialize(params)
      @id           = params[:id]
      @customer_id  = params[:customer_id]
      @merchant_id  = params[:merchant_id]
      @status       = params[:status]
    end

    def save
      @id = Invoice.add(self)
      self
    end

    def self.table
      Database.invoices
    end

    def to_hash
      {id: id, customer_id: customer_id, merchant_id: merchant_id, status: status}
    end

    def to_json(*args)
      {id: id, customer_id: customer_id, merchant_id: merchant_id, status: status}.to_json
    end

    def self.find_by_customer_id(id)
      result = table.where(:customer_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_customer_id(id)
      result = table.where(:customer_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_merchant_id(id)
      result = table.where(:merchant_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_merchant_id(id)
      result = table.where(:merchant_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_status(status)
      result = table.limit(1).where(:status => status).first
      new(result) if result
    end

    def self.find_all_by_status(status)
      result = table.where(:status => status)
      result.map{|result| new(result)} if result
    end

  end
end


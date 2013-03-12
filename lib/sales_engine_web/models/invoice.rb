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

    def self.find(params)
      if params[:id]
        find_by_id(params[:id])
      elsif params[:customer_id]
        find_by_customer_id(params[:customer_id])
      elsif params[:merchant_id]
        find_by_merchant_id(params[:merchant_id])
      else
        find_by_status(params[:status])
      end
    end

    def self.find_all(params)
      if params[:customer_id]
        find_all_by_customer_id(params[:customer_id])
      elsif params[:merchant_id]
        find_all_by_merchant_id(params[:merchant_id])
      else
        find_all_by_status(params[:status])
      end
    end
    
    def self.find_by_id(id)
      result = invoices.where(:id => id.to_i).first
      new(result) if result
    end

    def self.find_by_customer_id(id)
      result = invoices.where(:customer_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_customer_id(id)
      result = invoices.where(:customer_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_merchant_id(id)
      result = invoices.where(:merchant_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_merchant_id(id)
      result = invoices.where(:merchant_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_status(status)
      result = invoices.limit(1).where(:status => status).first
      new(result) if result
    end

    def self.find_all_by_status(status)
      result = invoices.where(:status => status)
      result.map{|result| new(result)} if result
    end

    def self.random
      result = invoices.to_a.sample
      new(result) if result
    end

  end
end


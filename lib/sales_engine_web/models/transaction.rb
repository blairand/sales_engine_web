require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Transaction
    extend KlassMethods
    
    attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result

    def initialize(params)
      @id = params[:id]
      @invoice_id = params[:invoice_id]
      @credit_card_number = params[:credit_card_number]
      @credit_card_expiration_date = params[:credit_card_expiration_date]
      @result = params[:result]
    end

    def save
      @id = Transaction.add(self)
      self
    end

    def self.table
      Database.transactions
    end

    def to_hash
      {id: id, invoice_id: invoice_id, credit_card_number: credit_card_number, credit_card_expiration_date: credit_card_expiration_date, result: result}
    end

    def to_json(*args)
      {id: id, invoice_id: invoice_id, credit_card_number: credit_card_number, credit_card_expiration_date: credit_card_expiration_date, result: result}.to_json
    end


    def self.find_by_invoice_id(id)
      result = table.where(:invoice_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_invoice_id(id)
      result = table.where(:invoice_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_credit_card_number(number)
      result = table.where(:credit_card_number => number.to_i).first
      new(result) if result
    end

    def self.find_all_by_credit_card_number(number)
      result = table.where(:credit_card_number => number.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_credit_card_expiration_date(date)
      result = table.where(:credit_card_expiration_date => date).first
      new(result) if result
    end

    def self.find_all_by_credit_card_expiration_date(date)
      result = table.where(:credit_card_expiration_date => date)
      result.map{|result| new(result)} if result
    end

    def self.find_by_result(result)
      result = table.where(:result => result).first
      new(result) if result
    end

    def self.find_all_by_result(result)
      result = table.where(:result => result)
      result.map{|result| new(result)} if result
    end

  end
end

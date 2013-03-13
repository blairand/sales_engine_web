require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Customer
    extend FinderMethods

    attr_reader :id, :first_name, :last_name

    def initialize(params)
      @id           = params[:id]
      @first_name   = params[:first_name]
      @last_name    = params[:last_name]
    end

    def save
      @id = Customer.add(self)
      self
    end

    def self.table
      Database.customers
    end

    def to_hash
      {id: id, first_name: first_name, last_name: last_name}
    end

    def to_json(*args)
      {id: id, first_name: first_name, last_name: last_name}.to_json
    end

    def self.find_by_first_name(name)
      result = table.limit(1).where(Sequel.ilike(:first_name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_all_by_first_name(name)
      result = table.where(Sequel.ilike(:first_name, "%#{name}%")).to_a
      result.collect{|result| new(result)}
    end

    def self.find_by_last_name(name)
      result = table.limit(1).where(Sequel.ilike(:last_name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_all_by_last_name(name)
      result = table.where(Sequel.ilike(:last_name, "%#{name}%")).to_a
      result.collect{|result| new(result)}
    end

  end
end

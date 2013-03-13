require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Item
    extend KlassMethods

    attr_reader :id, :name, :description, :unit_price, :merchant_id

    def initialize(params)
      @id           = params[:id]
      @name         = params[:name]
      @description  = params[:description]
      @unit_price   = params[:unit_price]
      @merchant_id  = params[:merchant_id]
    end

    def save
      @id = Item.add(self)
      self
    end

    def self.table
      Database.items
    end

    def to_hash
      {id: id, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id}
    end

    def to_json
      {id: id, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id}.to_json
    end

    def self.find_by_name(name)
      result = table.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_all_by_name(name)
      results = table.where(Sequel.ilike(:name, "%#{name}%"))
      results.map{|result| new(result)} if results
    end

    def self.find_by_description(desc)
      result = table.limit(1).where(Sequel.ilike(:description, "%#{desc}%")).first
      new(result) if result
    end

    def self.find_all_by_description(desc)
      results = table.where(Sequel.ilike(:description, "%#{desc}%"))
      results.map{|result| new(result)} if results
    end

    def self.find_by_unit_price(price)
      result = table.where(:unit_price => price.to_i).first
      new(result) if result
    end

    def self.find_all_by_unit_price(price)
      results = table.where(:unit_price => price.to_i)
      results.map{|result| new(result)} if results
    end

    def self.find_by_merchant_id(id)
      result = table.where(:merchant_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_merchant_id(id)
      results = table.where(:merchant_id => id.to_i)
      results.map{|result| new(result)} if results
    end

  end
end

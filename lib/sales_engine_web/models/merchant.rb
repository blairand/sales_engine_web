require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Merchant
    extend FinderMethods
    attr_reader :id, :name

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
    end

    def save
      @id = Merchant.add(self)
      self
    end

    def to_hash
      { :id => id, :name => name}
    end

    def to_json(*args)
      {:id => id, :name => name}.to_json
    end

    def self.find_by_id(id)
      result = table.where(:id => id.to_i).limit(1).first
      new(result) if result
    end

    def self.find_by_name(name)
      result = table.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_all_by_name(name)
      result = table.where(Sequel.ilike(:name, "%#{name}%")).to_a
      result.collect{|result| new(result)}
    end

    def self.table
      Database.merchants
    end
  end
end

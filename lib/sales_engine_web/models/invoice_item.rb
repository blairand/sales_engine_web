require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class InvoiceItem
    extend KlassMethods

    attr_reader :id, :item_id, :invoice_id, :quantity,:unit_price

    def initialize(params)
      @id           = params[:id]
      @item_id      = params[:item_id]
      @invoice_id   = params[:invoice_id]
      @quantity     = params[:quantity]
      @unit_price   = params[:unit_price]
    end

    def save
      @id = InvoiceItem.add(self)
      self
    end

    def self.table
      Database.invoice_items
    end

    def to_hash
      {id: id, item_id: item_id, invoice_id: invoice_id, quantity: quantity, unit_price: unit_price}
    end

    def to_json(*args)
      {id: id, item_id: item_id, invoice_id: invoice_id, quantity: quantity, unit_price: unit_price}.to_json
    end

    def self.find_by_invoice_id(id)
      result = table.where(:invoice_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_invoice_id(id)
      result = table.where(:invoice_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_item_id(id)
      result = table.where(:item_id => id.to_i).first
      new(result) if result
    end

    def self.find_all_by_item_id(id)
      result = table.where(:item_id => id.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_quantity(quantity)
      result = table.where(:quantity => quantity.to_i).first
      new(result) if result
    end

    def self.find_all_by_quantity(quantity)
      result = table.where(:quantity => quantity.to_i)
      result.map{|result| new(result)} if result
    end

    def self.find_by_unit_price(price)
      result = table.where(:unit_price => price.to_i).first
      new(result) if result
    end

    def self.find_all_by_unit_price(price)
      result = table.where(:unit_price => price.to_i)
      result.map{|result| new(result)} if result
    end

  end
end

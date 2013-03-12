require 'spec_helper'

module SalesEngineWeb
  describe Item do

    it "implements to_hash" 

    describe '.create' do
      it 'creates item'
    end

    describe "random" do 
      it "returns a random item"
    end

    context ".find" do
      it "finds an item by id" do 
        pending
        item = Item.find_by_id(1)
      end
      
      it "finds an item by name" do 
        pending
        item = Item.find_by_name("#{ item1.name }")
      end

      it "finds an item by description" do 
        pending
        item = Item.find_by_description("iphone")
      end

      it "finds an item by unit_price" do 
        pending
        item = Item.find_by_unit_price("#{item1.unit_price}")
      end

      it "finds an item by merchant_id" do 
        pending
        item = Item.find_by_merchant_id("#{item1.merchant_id}")
      end
    end

    context ".find_all" do
      it "finds all items by id" do 
        pending
        item = Item.find_all_by_id(1)
      end
      
      it "finds all items by name" do 
        pending
        item = Item.find_all_by_name("#{ item1.name }")
      end

      it "finds all items by description" do 
        pending
        item = Item.find_all_by_description("iphone")
      end

      it "finds all items by unit_price" do 
        pending
        item = Item.find_all_by_unit_price("#{item1.unit_price}")
      end

      it "finds all items by merchant_id" do 
        pending
        item = Item.find_all_by_merchant_id("#{item1.merchant_id}")
      end
    end

    describe "relationships" do 
      context "find_all invoice_items by Item ID" do 
        it "returns a collection of associated invoice items"
      end

      context "Find_all merchants by Item ID" do
        it "returns the associated merchant"
      end
    end

    describe "business intelligence" do
      context "sort items by revenue, return top X items" do
        it "returns the top x items ranked by total revenue generated"
      end

      context "sort items by volume, return top X items" do
        it "returns the top x item instances ranked by total number sold"
      end

      context "for a given item, find revenue by day, then sort the days by revenue and return the highest" do
        it "returns the date with the most sales for the given item using the invoice date"
      end
    end
  end
end

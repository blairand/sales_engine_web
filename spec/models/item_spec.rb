require 'spec_helper'

module SalesEngineWeb
  describe Item do

    before(:each) do
      merchant1
      item1
    end

    let(:merchant1){ SalesEngineWeb::Merchant.create(
      :name => "Jumpstart Lab"
      ) }
    let(:item1){ SalesEngineWeb::Item.create(
      :name => "iPhone5",
      :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
      :unit_price => 49999,
      :merchant_id => 1
      ) }

    it "implements to_hash" do 
      item = item1.to_hash
      expect( item ).to be_kind_of Hash
    end

    describe '.create' do
      it 'creates item' do 
        item = SalesEngineWeb::Item.create(
                                  :name => "iPhone5",
                                  :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
                                  :unit_price => 49999,
                                  :merchant_id => 1
                                  )
        expect( item ).to be_kind_of SalesEngineWeb::Item
      end
    end

    describe "random" do 
      it "returns a random item" do 
        item = Item.random
        expect( item ).to be_kind_of SalesEngineWeb::Item
      end
    end

    context ".find" do
      it "finds an item by id" do 
        item = Item.find_by_id(1)
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end
      
      it "finds an item by name" do 
        item = Item.find_by_name("#{ item1.name }")
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds an item by description" do 
        item = Item.find_by_description("iphone")
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds an item by unit_price" do 
        item = Item.find_by_unit_price("#{item1.unit_price}")
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds an item by merchant_id" do 
        item = Item.find_by_merchant_id("#{item1.merchant_id}")
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end
    end

    context ".find_all" do
      it "finds all items by name" do 
        item = Item.find_all_by_name("#{ item1.name }").first
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds all items by description" do 
        item = Item.find_all_by_description("iphone").first
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds all items by unit_price" do 
        item = Item.find_all_by_unit_price("#{item1.unit_price}").first
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
      end

      it "finds all items by merchant_id" do 
        item = Item.find_all_by_merchant_id("#{item1.merchant_id}").first
        expect( item.name ).to eq "iPhone5"
        expect( item.unit_price ).to eq 49999
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

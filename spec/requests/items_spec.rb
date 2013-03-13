require 'spec_helper'

describe "/items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

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

  describe ".random" do 
    it "returns a random item" do 
      get "/items/random"
      output = JSON.parse(last_response.body)
      expect( output['name'] ).to eq "iPhone5"
      expect( output['unit_price'] ).to eq 49999
    end
  end

  context "find" do

    describe "find by id" do 
      it "finds an item by id" do 
        get "/items/find?id=#{ item1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end
    
    describe "find by name" do 
      it "finds an item by name" do 
        get "/items/find?name=#{ item1.name }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end

    describe "find by description" do 
      it "finds an item by description" do 
        get "/items/find?description=iphone"
        output = JSON.parse(last_response.body)
        expect( output['name'] ).to eq item1.name
      end
    end

    describe "find by unit_price" do 
      it "finds an item by unit_price" do 
        get "/items/find?unit_price=#{item1.unit_price}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end

    describe "find by merchant_id" do 
      it "finds an item by merchant_id" do 
        get "/items/find?merchant_id=#{item1.merchant_id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end
  end

  describe "find_all by name" do 
    it "finds all items by name" do 
      get "/items/find_all?name=#{ item1.name }"
      output = JSON.parse(last_response.body)
      expect( output[0]['id'] ).to eq item1.id
      expect( output[0]['name'] ).to eq item1.name
    end
  end

  describe "find_all by description" do 
    it "finds all items by description" do 
      get "/items/find_all?description=iphone"
      output = JSON.parse(last_response.body)
      expect( output[0]['id'] ).to eq item1.id
      expect( output[0]['name'] ).to eq item1.name
    end
  end

  describe "find_all by unit_price" do 
    it "finds all items by unit_price" do 
      get "/items/find_all?unit_price=#{item1.unit_price}"
      output = JSON.parse(last_response.body)
      expect( output[0]['id'] ).to eq item1.id
      expect( output[0]['name'] ).to eq item1.name
    end
  end

  describe "find_all by merchant_id" do 
    it "finds all items by merchant_id" do 
      get "/items/find_all?merchant_id=#{item1.merchant_id}"
      output = JSON.parse(last_response.body)
      expect( output[0]['id'] ).to eq item1.id
      expect( output[0]['name'] ).to eq item1.name
    end
  end

  describe "relationships" do 
    
    context "/items/:id/invoice_items" do 
      it "returns a collection of associated invoice items"
    end

    context "/items/:id/merchant" do
      it "returns the associated merchant"
    end

  end

  describe "business intelligence" do

    context "/items/most_revenue?quantity=x" do
      it "returns the top x items ranked by total revenue generated"
    end

    context "/items/most_items?quantity=x" do
      it "returns the top x item instances ranked by total number sold"
    end

    context "/items/:id/best_day" do
      it "returns the date with the most sales for the given item using the invoice date"
    end
  end

end

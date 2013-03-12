require 'spec_helper'

describe "/items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    # item1
    # item2
    # item3
  end

  # let(:item1){ SalesEngineWeb::Item.create(
  #   :name => "iPhone5",
  #   :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
  #   :unit_price => 49999,
  #   :merchant_id => 1
  #   ) }
  # let(:item2){ SalesEngineWeb::Item.create(
  #   :name => "iPhone4",
  #   :description => "iPhone 4: The result is short and fat",
  #   :unit_price => 39999,
  #   :merchant_id => 1
  #   ) }
  # let(:item3){ SalesEngineWeb::Item.create(
  #   :name => "iPhone3",
  #   :description => "iPhone3 was great, but not that great",
  #   :unit_price => 29999,
  #   :merchant_id => 1
  #   ) }

  describe "random" do 
    it "returns a random item"
  end

  context "find" do

    describe "find by id" do 
      it "finds an item by id" do 
        pending
        get "/items/find?id=#{ item1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end
    
    describe "find by name" do 
      it "finds an item by name" do 
        pending
        get "/items/find?name=#{ item1.name }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end

    describe "find by description" do 
      it "finds an item by description" do 
        pending
        get "/items/find?description=iphone"
        output = JSON.parse(last_response.body)
      end
    end

    describe "find by unit_price" do 
      it "finds an item by unit_price" do 
        pending
        get "/items/find?unit_price=#{item1.unit_price}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end

    describe "find by merchant_id" do 
      it "finds an item by merchant_id" do 
        pending
        get "/items/find?merchant_id=#{item1.merchant_id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq item1.id
        expect( output['name'] ).to eq item1.name
      end
    end
  end

  context "find_all" do
    describe "find_all by name" do 
      it "finds all items by name" do 
        pending
        get "/items/find_all?id=#{ item1.id }"
        output = JSON.parse(last_response.body)
        expect( output ).to eq "something"
      end
    end

    describe "find_all by description" do 
      it "finds all items by description" do 
        pending
        get "/items/find_all?description=iphone"
        output = JSON.parse(last_response.body)
        expect( output ).to eq "something"
      end
    end

    describe "find_all by unit_price" do 
      it "finds all items by unit_price" do 
        pending
        get "/items/find_all?unit_price=#{item1.unit_price}"
        output = JSON.parse(last_response.body)
        expect( output ).to eq "something"
      end
    end

    describe "find_all by merchant_id" do 
      it "finds all items by merchant_id" do 
        pending
        get "/items/find_all?merchant_id=#{item1.merchant_id}"
        output = JSON.parse(last_response.body)
        expect( output ).to eq "something"
      end
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

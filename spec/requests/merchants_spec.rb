require 'spec_helper'

describe "/merchants/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1 && merchant2
  end

  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab") }
  let(:merchant2){ SalesEngineWeb::Merchant.create(:name => "gSchool") }
  let(:merchant3){ SalesEngineWeb::Merchant.create(:name => "Galvanize") }

  describe "random" do
    it "returns a random merchant" do
      get '/merchants/random'
      output = JSON.parse(last_response.body)
      expect( [ merchant1.id, merchant2.id ] ).to include( output['id'] )
    end
  end

  describe "find" do
    context "given an existing id" do
      it "finds the merchant" do
        get "/merchants/find?id=#{ merchant1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq merchant1.id
        expect( output['name'] ).to eq merchant1.name
      end

      it "finds merchant2" do
        get "/merchants/find?id=#{merchant2.id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq merchant2.id
        expect( output['name'] ).to eq merchant2.name
      end
    end

    context "given name='Jumpstart%20Lab'" do
      it "finds the merchant" do
        get "/merchants/find?name=Jumpstart%20Lab"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq merchant1.id
        expect( output['name'] ).to eq merchant1.name
      end
    end
  end

  describe "find all" do 
    context "given name 'blairiscool'" do 
      it "finds all the merchants named blairiscool" do 
        merchant1 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        merchant2 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        merchant3 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        get 'merchants/find_all?name=blairiscool'
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 3
        expect( output[0]["name"] ).to eq "blairiscool"
      end
    end
  end

  describe "relationships" do 
    context "/merchants/:id/items" do 
      it "returns a collection of items associated with that merchant"
    end 
    context "/merchants/:id/invoices" do 
      it "returns a collection of invoices associated with that merchant"
    end
  end

  describe "business intelligence for all merchants" do 
    context "/merchants/most_revenue?quantity=x" do 
      it "returns the top x merchants ranked by total revenue"
    end

    context "/merchants/most_items?quantity=x" do
      it "returns the top x merchants ranked by total number of items sold"
    end
    context "/merchants/revenue?date=x" do
      it "returns the total revenue for date x across all merchants"
    end
  end

  describe "business intelligence for a single merchant" do 
    context "/merchants/:id/revenue" do
      it "returns the total revenue for that merchant across all transactions"
    end
    
    context "/merchants/:id/revenue?date=x" do
      it "returns the total revenue for that merchant for a specific invoice date x"
    end

    context "/merchants/:id/favorite_customer" do
      it "returns the customer who has conducted the most successful transactions"
    end
    
    context "/merchants/:id/customers_with_pending_invoices" do
      it "returns a collection of customers which have pending (unpaid) invoices"
    end
  end

end

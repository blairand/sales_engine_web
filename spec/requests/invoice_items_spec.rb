require 'spec_helper'

describe "/invoice_items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

    before(:each) do
      merchant1
      customer1
      item1
      invoice1
      invoice_item1
    end

    let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab")}
    
    let(:customer1){ SalesEngineWeb::Customer.create(
      :first_name => "Blair",
      :last_name => "Anderson"
      )}
    
    let(:item1){ SalesEngineWeb::Item.create(
      :name => "iPhone5",
      :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
      :unit_price => 49999,
      :merchant_id => 1
      ) }

    let(:invoice1){ SalesEngineWeb::Invoice.create(
      :customer_id => 1,
      :merchant_id => 1,
      :status => "Shipped"
      ) }

    let(:invoice_item1){ SalesEngineWeb::InvoiceItem.create(
        :item_id => 1,
        :invoice_id=> 1,
        :quantity => 1,
        :unit_price=> 49999) }

  describe "random" do
    it "returns a random invoice_item"  do
      get '/invoice_items/random'
      output = JSON.parse(last_response.body)
      expect( output['item_id'] ).to eq 1
    end
  end

  describe "find by id" do 
    it "finds the invoice_item" do 
      get "/invoice_items/find?id=#{invoice_item1.id}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq 1
      expect(output['invoice_id']).to eq 1
      expect(output['quantity']).to eq 1
    end
  end

  describe "find by item_id" do 
    it "finds the invoice_item" do 
      get "/invoice_items/find?item_id=#{invoice_item1.item_id}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq 1
      expect(output['invoice_id']).to eq 1
      expect(output['quantity']).to eq 1
    end
  end

  describe "find by invoice_id" do 
    it "finds the invoice_item" do 
      get "/invoice_items/find?invoice_id=#{invoice_item1.invoice_id}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq 1
      expect(output['invoice_id']).to eq 1
      expect(output['quantity']).to eq 1
    end
  end

  describe "find by quantity" do 
    it "finds the invoice_item" do 
      get "/invoice_items/find?quantity=#{invoice_item1.quantity}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq 1
      expect(output['invoice_id']).to eq 1
      expect(output['quantity']).to eq 1
    end
  end

  describe "find by unit_price" do 
    it "finds the invoice_item" do 
      get "/invoice_items/find?unit_price=#{invoice_item1.unit_price}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq 1
      expect(output['invoice_id']).to eq 1
      expect(output['quantity']).to eq 1
    end
  end

  context ".find_all" do 

    describe "find_all by item_id" do 
      it "returns collection of invoice_items" do
        get "/invoice_items/find_all?item_id=#{invoice_item1.item_id}"
        output = JSON.parse(last_response.body)
        expect( output.count ).to eq 1
      end
    end

    describe "find_all by invoice_id" do 
      it "returns collection of invoice_items" do
        get "/invoice_items/find_all?invoice_id=#{invoice_item1.invoice_id}"
        output = JSON.parse(last_response.body)
        expect( output.count ).to eq 1
      end
    end

    describe "find_all by quantity" do 
      it "returns collection of invoice_items" do
        get "/invoice_items/find_all?quantity=#{invoice_item1.quantity}"
        output = JSON.parse(last_response.body)
        expect( output.count ).to eq 1
      end
    end

    describe "find_all by unit_price" do 
      it "returns collection of invoice_items" do
        get "/invoice_items/find_all?unit_price=#{invoice_item1.unit_price}"
        output = JSON.parse(last_response.body)
        expect( output.count ).to eq 1
      end 
    end
  end

  context "#invoice" do
    it "returns the associated invoice"
  end
  
  context "#item" do
    it "returns the associated item"
  end

end

require 'spec_helper'

describe "/invoice_items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  # before(:each) do
  #   # invoice_item1
  #   # invoice_item2
  #   # invoice_item3
  # end

  # let(:invoice_item1){ SalesEngineWeb::InvoiceItem.create(
    # :item_id => 1,
    # :invoice_id=> 2,
    # :quantity => 3,
    # :unit_price=> 7654)}

  describe "random" do
    it "returns a random invoice_item" do
      pending
      get '/invoice_items/random'
      output = JSON.parse(last_response.body)
      #expect( #something ).to eq #something
    end
  end

  describe "find by id" do 
    it "finds the invoice_item" do 
      pending
      get "/invoice_items/find?id=#{invoice_item1.id}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq "1"
      expect(output['invoice_id']).to eq "2"
      expect(output['quantity']).to eq "3"
    end
  end

  describe "find by invoice_id" do 
    it "finds the invoice_item" do 
      pending
      get "/invoice_items/find?invoice_id=#{invoice_item1.invoice_id}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq "1"
      expect(output['invoice_id']).to eq "2"
      expect(output['quantity']).to eq "3"
    end
  end

  describe "find by quantity" do 
    it "finds the invoice_item" do 
      pending
      get "/invoice_items/find?quantity=#{invoice_item1.quantity}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq "1"
      expect(output['invoice_id']).to eq "2"
      expect(output['quantity']).to eq "3"
    end
  end

  describe "find by unit_price" do 
    it "finds the invoice_item" do 
      pending
      get "/invoice_items/find?unit_price=#{invoice_item1.unit_price}"
      output = JSON.parse(last_response.body)
      expect(output['item_id']).to eq "1"
      expect(output['invoice_id']).to eq "2"
      expect(output['quantity']).to eq "3"
    end
  end

  context ".find_all" do 
    describe "find by invoice_id" do 
      it "finds the invoice_item"
    end

    describe "find by quantity" do 
      it "finds the invoice_item"
    end

    describe "find by unit_price" do 
      it "finds the invoice_item" 
    end
  end

  context "#invoice" do
    it "returns the associated invoice"
  end
  
  context "#item" do
    it "returns the associated item"
  end

end

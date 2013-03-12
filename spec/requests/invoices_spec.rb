require 'spec_helper'

describe "/invoices/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    invoice1
    invoice2
    invoice3
  end

  let(:invoice1){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 2,
    :status => "Shipped"
    ) }
  let(:invoice2){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 2,
    :status => "Shipped"
    ) }
  let(:invoice3){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 2,
    :status => "Shipped"
    ) }

  describe "random" do
    it "returns a random invoice" do
      get '/invoices/random'
      output = JSON.parse(last_response.body)
      expect( output['status'] ).to eq 'Shipped'
    end
  end

  describe "find by id" do 
    it "finds the invoice" do 
      get "/invoices/find?id=#{invoice1.id}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq "1"
      expect(output['merchant_id']).to eq "2"
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by customer_id" do 
    it "finds the invoice" do 
      get "/invoices/find?customer_id=#{invoice1.customer_id}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq "1"
      expect(output['merchant_id']).to eq "2"
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by merchant_id" do 
    it "finds the invoice" do 
      get "/invoices/find?merchant_id=#{invoice1.merchant_id}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq "1"
      expect(output['merchant_id']).to eq "2"
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by status" do 
    it "finds the invoice" do 
      get "/invoices/find?status=#{invoice1.status}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq "1"
      expect(output['merchant_id']).to eq "2"
      expect(output['status']).to eq "Shipped"
    end
  end

  context ".find_all" do 
    it "should find all by customer_id" do 
      get "/invoices/find_all?customer_id=#{invoice1.customer_id}"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 3
    end

    it "should find all by merchant_id" do 
      get "/invoices/find_all?merchant_id=#{invoice1.merchant_id}"
      output = JSON.parse(last_response.body)
      expect(output.size).to eq 3
    end

    it "should find all by status" do 
      get "/invoices/find_all?status=#{invoice1.status}"
      output = JSON.parse(last_response.body)
      expect(output.size).to eq 3
    end
  end

  context "relationships" do 
    describe "/invoices/:id/transactions" do 
      it "returns a collection of associated transactions"
    end

    describe "/invoices/:id/invoice_items" do
      it "returns a collection of associated invoice items"
    end
    
    describe "/invoices/:id/items" do
      it "returns a collection of associated items"
    end

    describe "/invoices/:id/customer" do
      it "returns the associated customer"
    end
    
    describe "/invoices/:id/merchant" do
      it "returns the associated merchant"
    end
  end

end

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

end

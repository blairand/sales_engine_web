require 'spec_helper'

describe "/invoices/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1
    merchant1
    invoice1
    invoice2
    invoice3
    transaction1
    item1
    invoice_item1
  end

  let(:customer1){ SalesEngineWeb::Customer.create(
    :first_name => "Blair",
    :last_name => "Anderson")}

  let(:merchant1){ SalesEngineWeb::Merchant.create(
    :name => "Jumpstart Lab") }

  let(:invoice1){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 1,
    :status => "Shipped") }
  let(:invoice2){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 1,
    :status => "Shipped") }
  let(:invoice3){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 1,
    :status => "Shipped") }
  let(:item1){ SalesEngineWeb::Item.create(
    :name => "iPhone5",
    :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
    :unit_price => 49999,
    :merchant_id => 1
    ) }
   let(:transaction1){ SalesEngineWeb::Transaction.create(
    :invoice_id => 1,
    :credit_card_number => 444412344440987,
    :credit_card_expiration_date => 1,
    :result => "Success") }

   let(:invoice_item1){ SalesEngineWeb::InvoiceItem.create(
        :item_id => 1,
        :invoice_id=> 1,
        :quantity => 1,
        :unit_price=> 49999) }

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
      expect(output['customer_id']).to eq 1
      expect(output['merchant_id']).to eq 1
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by customer_id" do 
    it "finds the invoice" do 
      get "/invoices/find?customer_id=#{invoice1.customer_id}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq 1
      expect(output['merchant_id']).to eq 1
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by merchant_id" do 
    it "finds the invoice" do 
      get "/invoices/find?merchant_id=#{invoice1.merchant_id}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq 1
      expect(output['merchant_id']).to eq 1
      expect(output['status']).to eq "Shipped"
    end
  end

  describe "find by status" do 
    it "finds the invoice" do 
      get "/invoices/find?status=#{invoice1.status}"
      output = JSON.parse(last_response.body)
      expect(output['customer_id']).to eq 1
      expect(output['merchant_id']).to eq 1
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
      it "returns a collection of associated transactions" do
        get "/invoices/1/transactions"
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 1
        expect( output[0]["credit_card_number"]).to eq "444412344440987"
      end
    end

    # describe "/invoices/:id/invoice_items" do
    #   it "returns a collection of associated invoice items" do
    #     get '/invoices/1/invoice_items'
    #     output = JSON.parse(last_response.body)
    #     expect( output.size ).to eq 1
    #     expect( output[0]["credit_card_number"]).to eq "444412344440987"
    #   end
    # end
    
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

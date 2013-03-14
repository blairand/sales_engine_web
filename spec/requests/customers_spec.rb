require 'spec_helper'

describe "/customers/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1
    merchant1
    invoice1
    transaction1
    transaction2
  end

  let(:customer1){ SalesEngineWeb::Customer.create(
    :first_name => "Blair",
    :last_name => "Anderson")}

  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab") }

  let(:invoice1){ SalesEngineWeb::Invoice.create(
    :customer_id => 1,
    :merchant_id => 1,
    :status => "Shipped") }

  let(:transaction1){ SalesEngineWeb::Transaction.create(
    :invoice_id => 1,
    :credit_card_number => 444412344440987,
    :credit_card_expiration_date => 1,
    :result => "Success") }

  let(:transaction2){ SalesEngineWeb::Transaction.create(
    :invoice_id => 1,
    :credit_card_number => 444412344440987,
    :credit_card_expiration_date => 1,
    :result => "Success") }

  describe "random" do 
    it "returns a random customer" do
      get '/customers/random'
      output = JSON.parse(last_response.body)
      expect( output['first_name'] ).to eq 'Blair'
    end
  end

  context "find" do
    describe "find by id" do 
      it "finds customer by id" do 
        get "/customers/find?id=#{ customer1.id }"
        output = JSON.parse(last_response.body)
        expect( output['first_name'] ).to eq customer1.first_name
        expect( output['last_name'] ).to eq customer1.last_name
      end
    end
    
    describe "find by first_name" do 
      it "finds an customer by name" do 
        get "/customers/find?first_name=#{ customer1.first_name }"
        output = JSON.parse(last_response.body)
        expect( output['first_name'] ).to eq customer1.first_name
        expect( output['last_name'] ).to eq customer1.last_name
      end
    end

    describe "find by last_name" do 
      it "finds an customer by name" do 
        get "/customers/find?last_name=#{ customer1.last_name }"
        output = JSON.parse(last_response.body)
        expect( output['first_name'] ).to eq customer1.first_name
        expect( output['last_name'] ).to eq customer1.last_name
      end
    end
  end

  context "find_all" do
   describe "find_all by first_name" do 
      it "finds customers by first name" do 
        get "/customers/find_all?first_name=#{ customer1.first_name }"
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 1
        expect( output[0]['first_name'] ).to eq customer1.first_name
        expect( output[0]['last_name'] ).to eq customer1.last_name
      end
    end

    describe "find_all by last_name" do 
      it "finds customers by last name" do 
        get "/customers/find_all?last_name=#{ customer1.last_name }"
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 1
        expect( output[0]['first_name'] ).to eq customer1.first_name
        expect( output[0]['last_name'] ).to eq customer1.last_name
      end
    end
  end

  describe "relationships" do 
    context "/customers/:id/invoices" do
      it "returns a collection of associated invoices" do 
        get "/customers/1/invoices"
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 1
        expect( output[0]['customer_id'] ).to eq 1
      end
    end

    context "/customers/:id/transactions" do
      it "returns a collection of associated transactions" do 
        get "/customers/1/transactions" 
        output = JSON.parse(last_response.body)
        expect( output.size ).to eq 2
        expect( output[0]['credit_card_number'] ).to eq "444412344440987"
      end
    end
  end

  describe "business intelligence" do
    context "/customers/:id/favorite_merchant" do
      it "returns a merchant where the customer has conducted the most successful transactions"
    end
  end

end

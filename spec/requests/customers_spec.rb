require 'spec_helper'

describe "/customers/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    # customer1
  end

  # let(:customer1){ SalesEngineWeb::Customer.create(
  #   ) }
  
  describe "random" do 
    it "returns a random customer"
  end

  context "find" do

    describe "find by id" do 
      it "finds customer by id" do 
        pending
        get "/customers/find?id=#{ customer1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq customer1.id
        expect( output['first_name'] ).to eq customer1.first_name
      end
    end
    
    describe "find by first_name" do 
      it "finds an customer by name" do 
        pending
        get "/customers/find?first_name=#{ customer1.first_name }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq customer1.id
        expect( output['first_name'] ).to eq customer1.first_name
      end
    end

    describe "find by last_name" do 
      it "finds an customer by name" do 
        pending
        get "/customers/find?last_name=#{ customer1.last_name }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq customer1.id
        expect( output['last_name'] ).to eq customer1.last_name
      end
    end
  end

  context "find_all" do
   describe "find_all by first_name" do 
      it "finds customers by first name" do 
        pending
        get "/customers/find_all?first_name=#{ customer1.first_name }"
        output = JSON.parse(last_response.body)
        #expect something
      end
    end

    describe "find_all by last_name" do 
      it "finds customers by last name" do 
        pending
        get "/customers/find_all?last_name=#{ customer1.last_name }"
        output = JSON.parse(last_response.body)
        #expect something
      end
    end
  end

  describe "relationships" do 
    context "/customers/:id/invoices" do
      it "returns a collection of associated invoices"
    end

    context "/customers/:id/transactions" do
      it "returns a collection of associated transactions"
    end
  end

  describe "business intelligence" do
    context "/customers/:id/favorite_merchant" do
      it "returns a merchant where the customer has conducted the most successful transactions"
    end
  end

end

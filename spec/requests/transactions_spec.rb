require 'spec_helper'

describe "/transactions/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  # before(:each) do
  #   transaction1
  # end

  # let(:transaction1){ SalesEngineWeb::Transaction.create() }

  describe "random" do
    it "returns a random transaction" do
      pending
      get '/transactions/random'
      output = JSON.parse(last_response.body)
      #expect some shit
    end
  end

  describe "find" do
    context "given an existing id" do
      it "finds the transaction" do
        pending
        get "/transactions/find?id=#{ transaction1.id }"
        output = JSON.parse(last_response.body)
        # expect(  ).to eq transaction1.id
        # expect(  ).to eq transaction1.name
      end
    end

    context ".find_by_invoice_id" do
      it "finds the transaction" do
        pending
        get "/transactions/find?invoice_id=#{ transaction1.invoice_id }"
      end
    end

    context ".find_by_credit_card_number" do
      it "finds the transaction" do
        pending
        get "/transactions/find?credit_card_number=#{ transaction1.credit_card_number }"
      end
    end

    context ".find_by_credit_card_expiration_date" do
      it "finds the transaction" do
        pending
        get "/transactions/find?credit_card_expiration_date=#{ transaction1.credit_card_expiration_date }"
      end
    end

    context ".find_by_result" do
      it "finds the transaction" do
        pending
        get "/transactions/find?result=#{ transaction1.result }"
      end
    end
  end

  describe "find all" do 
    context ".find_all_by_invoice_id" do
      it "finds all transactions"
    end
    
    context ".find_all_by_credit_card_number" do
      it "finds all transactions"
    end

    context ".find_all_by_credit_card_expiration_date" do
      it "finds all transactions"
    end

    context ".find_all_by_result" do
      it "finds all transactions"
    end
  end

  describe "#invoice" do 
    it "returns the associated invoice"
  end

end

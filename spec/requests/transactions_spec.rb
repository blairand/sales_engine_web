require 'spec_helper'

describe "/transactions/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1
    customer1
    invoice1
    transaction1
  end

  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab")}
    
  let(:customer1){ SalesEngineWeb::Customer.create(
      :first_name => "Blair",
      :last_name => "Anderson"
      )}

  let(:invoice1){ SalesEngineWeb::Invoice.create(
      :customer_id => 1,
      :merchant_id => 1,
      :status => "Shipped"
      ) }

  let(:transaction1){ SalesEngineWeb::Transaction.create(
      :invoice_id => 1,
      :credit_card_number => 444412344440987,
      :credit_card_expiration_date => 1,
      :result => "Success") }

  describe "random" do
    it "returns a random transaction" do
      get '/transactions/random'
      output = JSON.parse(last_response.body)
      expect( output['invoice_id'] ).to eq 1
    end
  end

  describe "find" do
    context "given an existing id" do
      it "finds the transaction" do
        get "/transactions/find?id=#{ transaction1.id }"
        output = JSON.parse(last_response.body)
        expect(output['invoice_id']).to eq 1
        expect(output['result']).to eq "Success"
      end
    end

    context ".find_by_invoice_id" do
      it "finds the transaction" do
        get "/transactions/find?invoice_id=#{ transaction1.invoice_id }"
        output = JSON.parse(last_response.body)
        expect(output['invoice_id']).to eq 1
        expect(output['result']).to eq "Success"
      end
    end

    context ".find_by_credit_card_number" do
      it "finds the transaction" do
        get "/transactions/find?credit_card_number=#{ transaction1.credit_card_number }"
        output = JSON.parse(last_response.body)
        expect(output['invoice_id']).to eq 1
        expect(output['result']).to eq "Success"
      end
    end

    context ".find_by_credit_card_expiration_date" do
      it "finds the transaction" do
        get "/transactions/find?credit_card_expiration_date=#{ transaction1.credit_card_expiration_date }"
        output = JSON.parse(last_response.body)
        expect(output['invoice_id']).to eq 1
        expect(output['result']).to eq "Success"
      end
    end

    context ".find_by_result" do
      it "finds the transaction" do
        get "/transactions/find?result=#{ transaction1.result }"
        output = JSON.parse(last_response.body)
        expect(output['invoice_id']).to eq 1
        expect(output['result']).to eq "Success"
      end
    end

  end

  describe "find all" do 
    context ".find_all_by_invoice_id" do
      it "finds all transactions" do
        get "/transactions/find_all?invoice_id=#{ transaction1.invoice_id }"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 1
      end
    end
    
    context ".find_all_by_credit_card_number" do
      it "finds all transactions" do
        get "/transactions/find_all?credit_card_number=#{ transaction1.credit_card_number }"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 1
      end
    end

    context ".find_all_by_credit_card_expiration_date" do
      it "finds all transactions" do
        get "/transactions/find_all?credit_card_expiration_date=#{ transaction1.credit_card_expiration_date }"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 1
      end
    end

    context ".find_all_by_result" do
      it "finds all transactions" do
        get "/transactions/find_all?result=#{ transaction1.result }"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 1
      end
    end
  end

  describe "#invoice" do 
    it "returns the associated invoice"
  end

end

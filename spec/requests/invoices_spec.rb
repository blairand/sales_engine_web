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

end

require 'spec_helper'

module SalesEngineWeb
  describe Invoice do
    let(:invoice1){ SalesEngineWeb::Invoice.create(
      :customer_id => 1,
      :merchant_id => 2,
      :status => "Shipped"
      ) }

    it "implements to_hash" do 
      invoice_hash = invoice1.to_hash
      expect( invoice_hash ).to be_kind_of Hash
      expect( invoice_hash[:status] ).to eq "Shipped"
    end

    it "implements to_json" do
      invoice = invoice1.to_json
      expect( invoice ).to be_kind_of String
    end

    describe '.create' do
      it 'creates a invoice' do
        invoice = Invoice.create(
          :customer_id => 1,
          :merchant_id => 2,
          :status => "Shipped")
        expect( invoice.customer_id ).to eq 1
      end
    end

    describe ".random" do
      it "returns a invoice" do
        invoice1 = SalesEngineWeb::Invoice.create(
          :customer_id => 1,
          :merchant_id => 2,
          :status => "Shipped")
        expect( Invoice.random ).to be_kind_of(SalesEngineWeb::Invoice)
      end
    end


  end
end

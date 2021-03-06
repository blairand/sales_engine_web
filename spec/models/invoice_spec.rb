require 'spec_helper'

module SalesEngineWeb
  describe Invoice do

    before(:each) do
      customer1
      merchant1
      invoice1
    end

    let(:customer1){ SalesEngineWeb::Customer.create(
      :first_name => "Blair",
      :last_name => "Anderson"
      )}

    let(:merchant1){ SalesEngineWeb::Merchant.create(
      :name => "Jumpstart Lab"
      ) }

    let(:invoice1){ SalesEngineWeb::Invoice.create(
      :customer_id => 1,
      :merchant_id => 1,
      :status => "Shipped"
      ) }

    it "implements to_hash" do
      invoice = invoice1.to_hash
      expect( invoice ).to be_kind_of Hash
      expect( invoice[:status] ).to eq "Shipped"
    end

    it "implements to_json" do
      customer1
      merchant1  
      invoice = invoice1.to_json
      expect( invoice ).to be_kind_of String
    end

    describe '.create' do
      it 'creates a invoice' do
        customer1
        merchant1 
        invoice = invoice1
        expect( invoice.customer_id ).to eq 1
      end
    end

    describe ".random" do
      it "returns a invoice" do
        invoice = Invoice.random
        expect( invoice ).to be_kind_of(SalesEngineWeb::Invoice)
      end
    end

    describe ".find" do 
      it "takes id and routes to find_by_id" do 
        params = {:id => 1}
        Invoice.should_receive(:find_by_id)
        Invoice.should_not_receive(:find_by_customer_id)
        Invoice.should_not_receive(:find_by_merchant_id)
        Invoice.should_not_receive(:find_by_status)
        target = Invoice.find(params)
      end
    end

    describe ".find" do 
      it "takes customer_id and routes to find_by_customer_id" do 
        params = {:customer_id => 1}
        Invoice.should_not_receive(:find_by_id)
        Invoice.should_receive(:find_by_customer_id)
        Invoice.should_not_receive(:find_by_merchant_id)
        Invoice.should_not_receive(:find_by_status)
        target = Invoice.find(params)
      end
    end

    describe ".find" do 
      it "takes merchant_id and routes to find_by_merchant_id" do 
        params = {:merchant_id => 1}
        Invoice.should_not_receive(:find_by_id)
        Invoice.should_not_receive(:find_by_customer_id)
        Invoice.should_receive(:find_by_merchant_id)
        target = Invoice.find(params)
      end
    end

    describe ".find" do 
      it "takes status and routes to find_by_status" do 
        params = {:status => "Shipped"}
        Invoice.should_not_receive(:find_by_id)
        Invoice.should_not_receive(:find_by_customer_id)
        Invoice.should_not_receive(:find_by_merchant_id)
        Invoice.should_receive(:find_by_status)
        target = Invoice.find(params)
      end
    end

    describe ".find_by_status" do 
      it "returns first invoice matching the status" do 
        target = Invoice.find_by_status("Shipped")
        expect( target.customer_id ).to eq 1
      end
    end

    describe ".find_by_id" do 
      it "returns invoice" do 
        target = Invoice.find_by_id(1)
        expect( target.id ).to eq 1
      end
    end

    describe ".find_by_customer_id" do 
      it "returns invoice" do 
        target = Invoice.find_by_customer_id(1)
        expect( target.customer_id ).to eq 1
        expect( target.merchant_id ).to eq 1
      end
    end

    describe ".find_by_merchant_id" do 
      it "returns nil for missing invoice" do 
        target = Invoice.find_by_merchant_id(3)
        expect(target).to eq nil
      end
    end

    describe ".find_by_merchant_id" do 
      it "returns invoice" do 
        target = Invoice.find_by_merchant_id(1)
        expect( target.customer_id ).to eq 1
        expect( target.merchant_id ).to eq 1
      end
    end

  describe ".find_all" do
    context "given a customer_id" do
      it "finds all matching invoices" do 
        customer2 = SalesEngineWeb::Customer.create(
          :first_name => "Blair",
          :last_name => "Anderson")
        invoice1 = SalesEngineWeb::Invoice.create(
          :customer_id => 2,
          :merchant_id => 1,
          :status => "Shipped")
        invoice2 = SalesEngineWeb::Invoice.create(
          :customer_id => 2,
          :merchant_id => 1,
          :status => "Shipped")
        target = Invoice.find_all_by_customer_id(2)
        expect( target.size ).to eq 2
      end
    end

    context "given a merchant_id" do
      it "finds all matching invoices" do 
        merchant1 = SalesEngineWeb::Merchant.create(
          :name => "Jumpstart Lab")
        invoice1 = SalesEngineWeb::Invoice.create(
          :customer_id => 1,
          :merchant_id => 2,
          :status => "Shipped")
        invoice2 = SalesEngineWeb::Invoice.create(
          :customer_id => 1,
          :merchant_id => 2,
          :status => "Shipped")
        target = Invoice.find_all_by_merchant_id(2)
        expect( target.size ).to eq 2
      end
    end

    context "given a status" do
      it "finds all matching invoices" do 
        target = Invoice.find_all_by_status("Shipped")
        expect( target.size ).to eq 1
      end
    end
  end

  describe "#transactions" do
    it "returns a collection of associated Transactions"
  end

  describe "#invoice_items" do
    it "returns a collection of associated Invoice_items"
  end
   
  describe "#items" do
    it "returns a collection of associated Items"
  end

  describe "#customer" do
    it "returns the associated customer"
  end
  
  describe "#merchant" do
    it "returns the associated merchant"
  end

  end
end

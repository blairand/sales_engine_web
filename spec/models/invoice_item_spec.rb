require 'spec_helper'

module SalesEngineWeb
  describe InvoiceItem do

    before(:each) do
      merchant1
      customer1
      item1
      invoice1
      invoice_item1
    end

    let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab")}
    
    let(:customer1){ SalesEngineWeb::Customer.create(
      :first_name => "Blair",
      :last_name => "Anderson"
      )}
    
    let(:item1){ SalesEngineWeb::Item.create(
      :name => "iPhone5",
      :description => "The result is iPhone 5: the thinnest, lightest, fastest iPhone ever",
      :unit_price => 49999,
      :merchant_id => 1
      ) }

    let(:invoice1){ SalesEngineWeb::Invoice.create(
      :customer_id => 1,
      :merchant_id => 1,
      :status => "Shipped"
      ) }

    let(:invoice_item1){ SalesEngineWeb::InvoiceItem.create(
          :item_id => 1,
          :invoice_id=> 1,
          :quantity => 1,
          :unit_price=> 49999) }

    describe '.create' do
      it 'creates invoice_item' do
        invoice_item = invoice_item1
        expect( invoice_item.item_id ).to eq 1
      end
    end

    it "implements to_hash" do 
      invoice_item = invoice_item1.to_hash
      expect( invoice_item ).to be_kind_of Hash
      expect( invoice_item[:item_id] ).to eq 1
    end

    it "implements to_json" do
      invoice_item = invoice_item1.to_json
      expect( invoice_item ).to be_kind_of String
    end

    describe ".random" do
      it "returns a invoice_item" do
        invoice_item  = invoice_item1
        target        = InvoiceItem.random
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end
 
    describe ".find_by_id" do 
      it "returns invoice_item" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_id(1)
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end

      it "returns nil for bad ID" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_invoice_id(23)
        expect(target).to eq nil
      end
    end

    describe ".find_by_item_id" do 
      it "returns invoice_item" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_item_id(1)
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    describe ".find_by_invoice_id" do 
      it "returns invoice_item" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_invoice_id(1)
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    describe ".find_by_quantity" do 
      it "returns invoice_item" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_quantity(1)
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    describe ".find_by_unit_price" do 
      it "returns invoice_item" do 
        invoice_item  = invoice_item1
        target = InvoiceItem.find_by_unit_price(49999)
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    
    describe ".find_all_by_item_id" do 
      it "returns collection of invoice_item" do 
        invoice_item = invoice_item1
        target = InvoiceItem.find_all_by_item_id(1).first
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    describe ".find_all_by_invoice_id" do 
      it "returns collection of invoice_item" do 
        invoice_item = invoice_item1
        target = InvoiceItem.find_all_by_invoice_id(1).first
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end 
    end

    describe ".find_all_by_quantity" do 
      it "returns collection of invoice_item" do 
        invoice_item = invoice_item1
        target = InvoiceItem.find_all_by_quantity(1).first
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end
    describe ".find_all_by_unit_price" do 
      it "returns collection of invoice_item" do 
        invoice_item = invoice_item1
        target = InvoiceItem.find_all_by_quantity(1).first
        expect( target.id ).to eq invoice_item.id
        expect( target.item_id ).to eq invoice_item.item_id
        expect( target.invoice_id ).to eq invoice_item.invoice_id
      end
    end

    describe "#invoice" do
      it "returns the associated invoice"
    end

    describe "#item" do
      it "returns the associated item"
    end

  end
end

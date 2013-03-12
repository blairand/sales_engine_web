require 'spec_helper'

module SalesEngineWeb
  describe InvoiceItem do
    # let(:invoice_item1){ SalesEngineWeb::InvoiceItem.create(
    #   ) }

    it "implements to_hash" do 
      pending
    end

    it "implements to_json" do
      pending
      invoice_item = invoice_item1.to_json
      expect( invoice_item ).to be_kind_of String
    end

    describe '.create' do
      it 'creates invoice_item' do
        pending
        invoice_item = InvoiceItem.create()
        expect( InvoiceItem.attribute ).to eq #
      end
    end

    describe ".random" do
      it "returns a invoice_item" do
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        expect( InvoiceItem.random ).to be_kind_of(SalesEngineWeb::InvoiceItem)
      end
    end
 
    describe ".find_by_id" do 
      #these next two tests are the same. 
      #one should be nil, one should be good. 
      it "returns invoice_item" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_id(1)
        expect( target.id ).to eq 1
      end

      it "returns nil for bad ID" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_invoice_id(1)
        expect(target).to eq nil
      end
    end

    describe ".find_by_item_id" do 
      it "returns invoice_item" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_item_id(1)
        #expect someting
      end
    end

    describe ".find_by_invoice_id" do 
      it "returns invoice_item" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_invoice_id(2)
        #expect seomthing
      end
    end

    describe ".find_by_quantity" do 
      it "returns invoice_item" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_quantity(2)
        #expect seomthing
      end
    end

    describe ".find_by_unit_price" do 
      it "returns invoice_item" do 
        pending
        invoice_item1 = SalesEngineWeb::InvoiceItem.create()
        target = InvoiceItem.find_by_unit_price(2)
        #expect something
      end
    end

    
    describe ".find_all_by_item_id" do 
      it "returns collection of invoice_item"
    end

    describe ".find_all_by_invoice_id" do 
      it "returns collection of invoice_item" 
    end

    describe ".find_all_by_quantity" do 
      it "returns collection of invoice_item"
    end
    describe ".find_all_by_unit_price" do 
      it "returns collection of invoice_item"
    end

    describe "#invoice" do
      it "returns the associated invoice"
    end

    describe "#item" do
      it "returns the associated item"
    end

  end
end

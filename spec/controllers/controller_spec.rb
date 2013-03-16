require 'spec_helper'

module SalesEngineWeb
  describe Controller do
    

    context "given merchants" do
      it ".route sends message to the correct table" do
        table = "merchants"
        Item.should_not_receive(:random)
        InvoiceItem.should_not_receive(:random)
        Transaction.should_not_receive(:random)
        Customer.should_not_receive(:random)
        Invoice.should_not_receive(:random)
        Merchant.should_receive(:random)

        Controller.random(table)
      end
    end

    context "given invoice_items route" do
      it "sends message to the correct table" do
        table = "invoice_items"
        Item.should_not_receive(:random)
        Transaction.should_not_receive(:random)
        Customer.should_not_receive(:random)
        Invoice.should_not_receive(:random)
        Merchant.should_not_receive(:random)
        InvoiceItem.should_receive(:random)

        Controller.random(table)
      end
    end

    context "given items route" do
      it "sends message to the correct table" do
        table = "items"
        Item.should_receive(:random)
        Controller.random(table)
      end
    end

    context "given customers route" do
      it "sends message to the correct table" do
        table = "customers"
        Customer.should_receive(:random)
        Controller.random(table)
      end
    end

    context "given transactions route" do
      it "sends message to the correct table" do
        table = "transactions"
        Transaction.should_receive(:random)
        Controller.random(table)
      end
    end

    context "given invoice_items route" do 
      it "sends the find message to the correct table" do
        table = "invoice_items"
        params = {:id => 1}
        Item.should_not_receive(:random)
        Transaction.should_not_receive(:find)
        Customer.should_not_receive(:find_all)
        Invoice.should_not_receive(:find)
        Merchant.should_not_receive(:random)
        InvoiceItem.should_receive(:find)

        Controller.find(table,params)
      end
    end


  end
end

require 'spec_helper'

module SalesEngineWeb
  describe Customer do

    let(:customer1){ SalesEngineWeb::Customer.create(
      :first_name => "Blair",
      :last_name => "Anderson"
      )}

    it "implements to_hash" do
      customer = customer1.to_hash
      expect( customer ).to be_kind_of Hash
      expect( customer[:first_name] ).to eq "Blair"
    end

    describe ".create" do
      it 'creates customer' do
        customer = SalesEngineWeb::Customer.create(
          :first_name => "Blair",
          :last_name => "Anderson")
        expect( customer.id ).to eq 1
      end
    end

    describe "random" do 
      it "returns a random customer" do
        target = customer1
        customer = Customer.random
        expect( customer ).to be_kind_of(SalesEngineWeb::Customer)
      end
    end

    context ".find" do
      it "finds a customer by id" do 
        target = customer1
        customer = Customer.find_by_id(1)
        expect( customer.first_name ).to eq target.first_name
        expect( customer.last_name ).to eq target.last_name
      end

      it "finds a customer by first_name" do 
        target = customer1
        customer = Customer.find_by_first_name("#{ customer1.first_name }")
        expect( customer.first_name ).to eq target.first_name
        expect( customer.last_name ).to eq target.last_name
      end

      it "finds a customer by last_name" do 
        target = customer1
        customer = Customer.find_by_last_name("#{ customer1.last_name }")
        expect( customer.first_name ).to eq target.first_name
        expect( customer.last_name ).to eq target.last_name
      end
    end

    context ".find_all" do
      it "find_all customers by first_name" do 
        target = customer1
        customers = Customer.find_all_by_first_name("Blair")
        expect( customers.size ).to eq 1
        expect( customers.first.first_name ).to eq "Blair"
      end

      it "find_all customers by last_name" do 
        target = customer1
        customers = Customer.find_all_by_last_name("#{ customer1.last_name }")
        expect( customers.size ).to eq 1
        expect( customers.first.first_name ).to eq "Blair"
      end
    end

    describe "relationships" do 
      context "Find_all invoices by customer_id" do
        it "returns a collection of associated invoices"
      end

      context "find_all transactions by through invoice by customer_id" do
        it "returns a collection of associated transactions"
      end
    end

    describe "business intelligence" do
      context "given successful transactions, group by merchant" do
        it "returns a merchant where the customer has conducted the most successful transactions"
      end
    end

  end
end

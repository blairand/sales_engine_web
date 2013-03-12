require 'spec_helper'

module SalesEngineWeb
  describe Customer do

    it "implements to_hash" do
      pending
    end

    describe ".create" do
      it 'creates customer'
    end

    describe "random" do 
      it "returns a random customer"
    end

    context ".find" do
      it "finds a customer by id" do 
        pending
        customer = Customer.find_by_id(1)
      end

      it "finds a customer by first_name" do 
        pending
        customer = Customer.find_by_first_name("#{ customer1.first_name }")
      end

      it "finds a customer by last_name" do 
        pending
        customer = Customer.find_by_last_name("#{ customer1.last_name }")
      end
    end

    context ".find_all" do
      it "find_all customers by first_name" do 
        pending
        customer = Customer.find_all_by_first_name("#{ customer1.first_name }")
      end

      it "find_all customers by last_name" do 
        pending
        customer = Customer.find_all_by_last_name("#{ customer1.last_name }")
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

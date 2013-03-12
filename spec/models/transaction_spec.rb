require 'spec_helper'

module SalesEngineWeb
  describe Transaction do

    it "implements to_hash" 

    describe '.create' do
      it 'creates transaction'
    end

    describe "random" do 
      it "returns a random transaction"
    end

  
    describe "find" do

      context ".find_by_id" do
        it "finds transaction" do 
          pending
          transaction = Transaction.find_by_id(1)
        end
      end

      context ".find_by_invoice_id" do
        it "finds all transactions"
      end
      
      context ".find_by_credit_card_number" do
        it "finds all transactions"
      end

      context ".find_by_credit_card_expiration_date" do
        it "finds all transactions"
      end

      context ".find_by_result" do
        it "finds all transactions"
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

    describe "relationships" do 
    end

  end
end

require 'spec_helper'

module SalesEngineWeb
  describe Transaction do

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

    describe '.create' do
      it 'creates transaction' do
        transaction = transaction1
        expect( transaction.invoice_id ).to eq 1
      end
    end

    it "implements to_hash" do 
      transaction = transaction1.to_hash
      expect( transaction ).to be_kind_of Hash
      expect( transaction[:invoice_id] ).to eq 1
    end

    it "implements to_json" do
      transaction = transaction1.to_json
      expect( transaction ).to be_kind_of String
    end

    describe ".random" do
      it "returns a transaction" do
        transaction  = transaction1
        target       = Transaction.random
        expect( target.id ).to eq transaction.id
        expect( target.invoice_id ).to eq transaction.invoice_id
      end
    end

  
    describe "find" do

      context ".find_by_id" do
        it "finds transaction" do 
          transaction = transaction1
          target      = Transaction.find_by_id(1)
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end

      context ".find_by_invoice_id" do
        it "finds all transactions" do 
          transaction = transaction1
          target = Transaction.find_by_invoice_id(1)
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end
      
      context ".find_by_credit_card_number" do
        it "finds all transactions" do 
          transaction = transaction1
          num = transaction1.credit_card_number
          target = Transaction.find_by_credit_card_number(num)
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end

      context ".find_by_credit_card_expiration_date" do
        it "finds all transactions" do 
          transaction = transaction1
          num = transaction1.credit_card_expiration_date
          target = Transaction.find_by_credit_card_expiration_date(num)
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end

      context ".find_by_result" do
        it "finds all transactions" do 
          transaction = transaction1
          target = Transaction.find_by_result(transaction1.result)
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end
    end
      
    describe "find all" do 
      context ".find_all_by_invoice_id" do
        it "finds all transactions" do 
          transaction = transaction1
          target = Transaction.find_all_by_invoice_id(1).first
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end
      
      context ".find_all_by_credit_card_number" do
        it "finds all transactions" do 
          transaction = transaction1
          num = transaction1.credit_card_number
          target = Transaction.find_all_by_credit_card_number(num).first
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end

      context ".find_all_by_credit_card_expiration_date" do
        it "finds all transactions" do 
          transaction = transaction1
          num = transaction1.credit_card_expiration_date
          target = Transaction.find_all_by_credit_card_expiration_date(num).first
          expect( target.id ).to eq transaction.id
          expect( target.invoice_id ).to eq transaction.invoice_id
        end
      end

      context ".find_all_by_result" do
        it "finds all transactions" do 
          transaction = transaction1
          target = Transaction.find_all_by_result(transaction1.result).first
          expect( target.id ).to eq 1
        end
      end
    end

    describe "relationships" do 
    end

  end
end

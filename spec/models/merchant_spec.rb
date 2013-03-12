require 'spec_helper'

module SalesEngineWeb
  describe Merchant do
    describe '.create' do
      it 'creates a merchant' do
        merchant = Merchant.create(:name => "Jumpstart Lab")
        expect( merchant.name ).to eq "Jumpstart Lab"
      end
    end

    describe ".find" do 
      it "takes name and routes to find_by_name" do 
        merchant = Merchant.create(:name => "Jumpstart Lab")
        params = {:name => "Jumpstart Lab"}
        Merchant.should_not_receive(:find_by_id)
        Merchant.should_receive(:find_by_name)
        target = Merchant.find(params)
      end
    end
    describe ".find" do 
      it "takes id and routes to find_by_id" do 
        merchant = Merchant.create(:name => "Jumpstart Lab")
        params = {:id => 1}
        Merchant.should_not_receive(:find_by_name)
        Merchant.should_receive(:find_by_id)
        target = Merchant.find(params)
      end
    end

    describe '.find_by_id' do
      it "finds a merchant" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find_by_id( target.id )
        expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end
    end

    describe '.find_by_name' do
      it "finds a merchant by name" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find_by_name("Jumpstart Lab")
        expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end

      it "finds by name, case insensitive" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find_by_name("jumpstart lab")
        expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end
    end

    describe ".random" do
      it "returns a merchant" do
        Merchant.create(:name => "Jumpstart Lab")
        expect( Merchant.random ).to be_kind_of(Merchant)
      end
    end

    it "implements to_hash" do 
      merchant = Merchant.create(:name => "Jumpstart Lab")
      merchant_hash = merchant.to_hash
      expect( merchant_hash ).to be_kind_of Hash
      expect( merchant_hash[:name] ).to eq "Jumpstart Lab"
    end

    describe ".find_all" do 
      it "finds all the merchants named blairiscool" do 
        merchant1 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        merchant2 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        merchant3 = SalesEngineWeb::Merchant.create(:name => "blairiscool")
        output = Merchant.find_all_by_name("blairiscool")
        expect( output.size ).to eq 3
        expect( output[0].name ).to eq "blairiscool"
      end      
    end

  end
end

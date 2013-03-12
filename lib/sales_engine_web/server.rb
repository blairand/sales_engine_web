module SalesEngineWeb
  class Server < Sinatra::Base
    get '/merchants/find' do
      Merchant.find(params).to_json
    end

    get '/merchants/find_all' do 
      #Merchant.find_all pulls a hash from the db, then creates instance
      merchants = Merchant.find_all_by_name(params[:name])

      #This turns the collection of instances into a collection of hashes and then into a json array of hashes
      body merchants.collect{|merchant| merchant.to_hash}.to_json

      #Sounds like we would want to pull from the DB, then to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end

    # get '/invoices/find' do
    #   Invoice.find(params).to_json
    # end

    get '/invoices/random' do
      Invoice.random.to_json
    end
    
  end
end

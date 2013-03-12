module SalesEngineWeb
  class Server < Sinatra::Base
    get '/merchants/find' do
      Merchant.find(params).to_json
    end

    get '/merchants/find_all' do 
      status 200
      merchants = Merchant.find_all_by_name(params[:name])
      body merchants.collect{|merchant| merchant.to_hash}.to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end
  end
end

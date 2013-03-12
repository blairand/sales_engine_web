module SalesEngineWeb
  class Server < Sinatra::Base
    get '/merchants/find' do
      Merchant.find(params).to_json
    end

    get '/merchants/find_all' do 
      merchants = Merchant.find_all_by_name(params[:name])
      body merchants.collect{|merchant| merchant.to_hash}.to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end

    get '/invoices/find' do
      Invoice.find(params).to_json
    end

    get '/invoices/find_all' do
      invoices = Invoice.find_all(params)
      body invoices.map{|invoice| invoice.to_hash}.to_json
    end

    get '/invoices/random' do
      Invoice.random.to_json
    end

  end
end

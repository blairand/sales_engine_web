module SalesEngineWeb
  class Server < Sinatra::Base

    get '/customers/find' do
      Customer.find(params).to_json
    end

    get '/customers/find_all' do
      Customer.find_all(params).to_json
    end

    get '/customers/random' do
      Customer.random.to_json
    end

    get '/invoices/find' do
      Invoice.find(params).to_json
    end

    get '/invoices/find_all' do
      Invoice.find_all(params).to_json
    end

    get '/invoices/random' do
      Invoice.random.to_json
    end

    get '/invoice_items/find' do
      InvoiceItem.find(params).to_json
    end

    get '/invoice_items/find_all' do
      InvoiceItem.find_all(params).to_json
    end

    get '/invoice_items/random' do
      InvoiceItem.random.to_json
    end

    get '/items/find' do
      Item.find(params).to_json
    end

    get '/items/find_all' do
      Item.find_all(params).to_json
    end

    get '/items/random' do
      Item.random.to_json
    end

    get '/merchants/find' do
      Merchant.find(params).to_json
    end

    get '/merchants/find_all' do 
      Merchant.find_all(params).to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end

    get '/transactions/find' do
      Transaction.find(params).to_json
    end

    get '/transactions/find_all' do
      Transaction.find_all(params).to_json
    end

    get '/transactions/random' do
      Transaction.random.to_json
    end

  end
end

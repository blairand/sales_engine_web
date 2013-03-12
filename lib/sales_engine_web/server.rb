module SalesEngineWeb
  class Server < Sinatra::Base

    # get '/customers/find' do
    #   Customer.find(params).to_json
    # end

    # get '/customers/find_all' do
    #   customers = Customer.find_all(params)
    #   body customers.map{|customer| customer.to_hash}.to_json
    # end

    get '/customers/random' do
      Customer.random.to_json
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

    # get '/invoice_items/find' do
    #   InvoiceItem.find(params).to_json
    # end

    # get '/invoice_items/find_all' do
    #   invoice_items = InvoiceItem.find_all(params)
    #   body invoice_items.map{|invoice_item| invoice_item.to_hash}.to_json
    # end

    # get '/invoice_items/random' do
    #   InvoiceItem.random.to_json
    # end

    # get '/items/find' do
    #   Item.find(params).to_json
    # end

    # get '/items/find_all' do
    #   items = Item.find_all(params)
    #   body items.map{|item| item.to_hash}.to_json
    # end

    # get '/items/random' do
    #   Item.random.to_json
    # end

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

    # get '/transactions/find' do
    #   Transaction.find(params).to_json
    # end

    # get '/transactions/find_all' do
    #   transactions = Transaction.find_all(params)
    #   body transactions.map{|transaction| transaction.to_hash}.to_json
    # end

    # get '/transactions/random' do
    #   Transaction.random.to_json
    # end

  end
end

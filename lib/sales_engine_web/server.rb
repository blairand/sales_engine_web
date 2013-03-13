module SalesEngineWeb
  class Server < Sinatra::Base

    get '/:table/random' do |table|
      Controller.route(table,:random)
    end

    get '/:table/find' do |table|
      Controller.route(table,:find,params)
    end

    get '/:table/find_all' do |table|
      Controller.route(table,:find_all,params)
    end

    get '/customers/:id/invoices' do |id|
      Invoice.find_all_by_customer_id(id).to_json
    end

    get '/customers/:id/transactions' do |id|
      invoices = Invoice.find_all_by_customer_id(id)
      invoices.map{|invoice|Transaction.find_by_invoice_id(invoice.id)}.to_json
    end

    get '/invoices/:id/transactions' do |id|
    # returns a collection of associated transactions
      Transaction.find_all_by_invoice_id(id).to_json
    end

  end
end

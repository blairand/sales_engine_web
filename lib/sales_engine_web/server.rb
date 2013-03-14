module SalesEngineWeb
  class Server < Sinatra::Base

    get '/:table/random' do |table|
      Controller.route(table,:random).to_json
    end

    get '/:table/find' do |table|
      Controller.route(table,:find,params).to_json
    end

    get '/:table/find_all' do |table|
      Controller.route(table,:find_all,params).to_json
    end

    get '/:table/:id/:function' do |table,id,function|
      Controller.route(table,:find,:id => id).send(function.to_sym).to_json
    end

  end
end

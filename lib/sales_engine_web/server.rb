module SalesEngineWeb
  class Server < Sinatra::Base

    get '/:table/random' do |table|
      Controller.random(table).to_json
    end

    get '/:table/find' do |table|
      Controller.find(table,params).to_json
    end

    get '/:table/find_all' do |table|
      Controller.find_all(table,params).to_json
    end

    get '/:table/:id/:function' do |table,id,function|
      Controller.find_more(table,{:id => id},function.to_sym).to_json
    end

  end
end

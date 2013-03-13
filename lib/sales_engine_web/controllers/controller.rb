module SalesEngineWeb
  class Controller
    attr_accessor :table, :function
    
    def self.route(table,function,params={})
      @table = camel_case(de_pluralize(table))
      @function = function
      get_response(params)
    end

    def self.get_response(params)
      if params == {}
        SalesEngineWeb.const_get(@table).send(@function).to_json
      else
        SalesEngineWeb.const_get(@table).send(@function,params).to_json
      end
    end

    def self.de_pluralize(word)
      return word if word[-1] != "s"
      word[0..-2]
    end

    def self.camel_case(word)
      return word if word !~ /_/ && word =~ /[A-Z]+.*/
      word.split('_').map{|e| e.capitalize}.join
    end

  end
end

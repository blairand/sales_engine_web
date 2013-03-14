module SalesEngineWeb
  class Controller
    attr_accessor :table, :function
    
    def self.route(table,function,params={})
      @table = camel_case(take_off_s(table))
      @function = function.to_sym
      get_response(params)
    end

    def self.get_response(params)
      if params == {}
        SalesEngineWeb.const_get(@table).send(@function)
      else
        SalesEngineWeb.const_get(@table).send(@function,params)
      end
    end

    def self.take_off_s(word)
      return word if word[-1] != "s"
      word[0..-2]
    end

    def self.camel_case(word)
      return word if word !~ /_/ && word =~ /[A-Z]+.*/
      word.split('_').map{|e| e.capitalize}.join
    end

  end
end

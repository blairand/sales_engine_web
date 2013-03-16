module SalesEngineWeb
  class Controller
    attr_accessor :table, :function
    
    def self.random(table)  
      klass(table).send(:random)
    end

    def self.find(table,params)
      klass(table).send(:find,params)
    end

    def self.find_all(table,params)
      klass(table).send(:find_all,params)
    end

    def self.find_more(table,params,function)
      klass(table).send(:find,params).send(function)
    end

    def self.klass(table)
      SalesEngineWeb.const_get(camel_case(take_off_s(table)))
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

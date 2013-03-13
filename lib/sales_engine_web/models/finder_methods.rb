module SalesEngineWeb
  module FinderMethods

    def create(params)
      self.new(params).save
    end

    def add(subject)
      table.insert(subject.to_hash)
    end

    def random
      result = table.to_a.sample
      self.new(result) if result
    end

    def find_by_id(id)
      result = table.where(:id => id.to_i).first
      new(result) if result
    end

    def find(params)
      attribute = params.keys.first
      self.send("find_by_#{attribute}",params[attribute.to_sym])
    end

    def find_all(params)
      attribute = params.keys.first
      self.send("find_all_by_#{attribute}",params[attribute.to_sym])
    end

    def has_many(things)
      define_method things do
        things_class = SalesEngineWeb.const_get(things.to_s[0..-2].capitalize)
        method_name = "find_all_by_#{ self.class.to_s.split('::').last.downcase }_id"
        things_class.send(method_name, id)
      end
    end

  end
end

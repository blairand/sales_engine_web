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

    def belongs_to(relation)
      new_class = relation.to_s.split('_').map{|e| e.capitalize}.join
      define_method relation do
        relation_class = SalesEngineWeb.const_get(new_class)
        method_name = "find_by_id"
        relation_id = self.send("#{relation}_id".to_sym) 
        relation_class.send(method_name, relation_id)
      end
    end

    def has_many(things)
      new_class = things[0..-2].split('_').map{|e| e.capitalize}.join
      define_method things do
        things_class = SalesEngineWeb.const_get(new_class)
        method_name = "find_all_by_#{ self.class.to_s.split('::').last.downcase }_id"
        things_class.send(method_name, id)
      end
    end


    def has_many_through(association, through)
      new_class = association[0..-2].split('_').map{|e| e.capitalize}.join

      define_method association do
        assoc_class = SalesEngineWeb.const_get(new_class)
        finder_method = "find_all_by_#{ through[0..-2] }_id"
        
        through_objects = self.send(through)

        through_objects.map do |object| 
          assoc_class.send(finder_method, object.id)
        end.flatten
      end
    end


  end
end

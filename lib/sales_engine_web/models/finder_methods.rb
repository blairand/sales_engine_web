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

    def verify_finder(params,search)
      params.keys.select do |attribute| 
        self.respond_to?("#{search}#{attribute}")
      end.pop
    end

    def find(params)
      attribute = verify_finder(params,"find_by_")
      self.send("find_by_#{attribute}", params[attribute])
    end

    def find_all(params)
      attribute = verify_finder(params,"find_all_by_")
      self.send("find_all_by_#{attribute}", params[attribute])
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

    def self.new_class(association)
      association[0..-2].split('_').map{|e| e.capitalize}.join
    end

    def has_many(association)
      new_class = FinderMethods.new_class(association)
      define_method association do
        things_class = SalesEngineWeb.const_get(new_class)
        method_name = "find_all_by_#{ self.class.to_s.split('::').last.downcase }_id"
        things_class.send(method_name, id)
      end
    end

    def has_many_through(association, through)
      new_class = FinderMethods.new_class(association)
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

module SalesEngineWeb
  module KlassMethods

    def create(params)
      self.new(params).save
    end

    def add(invoice)
      table.insert(invoice.to_hash)
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

  end
end

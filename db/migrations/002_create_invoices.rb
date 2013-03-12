Sequel.migration do
  change do
    create_table :invoices do
      primary_key :id
      String :customer_id
      String :merchant_id
      String :status
      Datetime :created_at
      Datetime :updated_at 
    end
  end
end

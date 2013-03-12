Sequel.migration do
  change do
    alter_table(:invoices) do
      drop_column :customer_id
      drop_column :merchant_id
    end
  end
end
 Sequel.migration do
  change do
    alter_table(:invoices) do
      add_column :customer_id, foreign_key
      add_column :merchant_id, foreign_key
    end
  end
end

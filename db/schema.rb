Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      column :username, "text", :null=>false
      column :access_token, "text", :null=>false
      
      primary_key [:username]
    end
  end
end

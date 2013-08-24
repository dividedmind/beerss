Sequel.migration do
  change do
    create_table :users do
      String :username, primary_key: true
      String :access_token, null: false, unique: true
    end
  end
end

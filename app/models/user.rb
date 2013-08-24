class User < Sequel::Model
  unrestrict_primary_key
  
  def self.of_access_token token
    return nil unless token
    user = find access_token: token
    unless user
      username = client(token).name
      return nil unless username
      user = User.create username: username, access_token: token
    end
    user
  end
  
  private
  def self.client access_token
    Beeminder::User.new access_token, auth_type: :oauth
  end
end

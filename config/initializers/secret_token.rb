require 'securerandom'

unless secret_key_base = ENV['SECRET_KEY_BASE']
  Rails.logger.warn "No $SECRET_KEY_BASE set, generating a random one (this will invalidate all cookies when server restarts)"
  secret_key_base = SecureRandom.hex(64)
end

Beerss::Application.config.secret_key_base = secret_key_base

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_postrcard_session',
  :secret      => 'b0d137942d45886b1c940d7f47e31061efc91a159f04173aa8fc640c510e20ee5a35caba939ed81e91057f744b5c95195ae74760bf0bcf7b82e8899fce256286'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

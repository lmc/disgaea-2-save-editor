# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_disgaea-2-save-editor_session',
  :secret      => '9984d221fcb83ad2ac31dbf6a8822ff369ec69c684cc510b7f997d683f38b54e200537eaf3914e6f5ea50842d6dfb5c467fdb10b7f7d868508f7006e868b8717'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

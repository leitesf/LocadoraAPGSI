# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LocadoraAPGSI_session',
  :secret      => 'ce2c88f64b656cab4f3313fb694e1346722ae745d84c51abbed4c084c2de1b45fb3d699f577ffe8b5b5eec82ffebc1b7f808332ead09b841d4d8a20f6b915b1d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

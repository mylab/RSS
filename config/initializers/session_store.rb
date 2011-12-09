# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_exercise_session',
  :secret      => 'dfd330851dc6d9dce89d55d7f072453d2383333ff0ab841cd67338dbab6327134b621044723e426a541a6486f200e289f7e3a75fd7e12ffc9dfdd9acee5ff10e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Compile the assets
bundle exec rake assets:precompile

export RAILS_SERVE_STATIC_FILES=true
# Start the server
bundle exec rails server

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/]
# Add the fonts directory to the asset paths
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")

# Enable the asset pipeline
Rails.application.config.assets.enabled = true
# Prevent database connection and app initializing during precompile
Rails.application.config.assets.initialize_on_precompile = false
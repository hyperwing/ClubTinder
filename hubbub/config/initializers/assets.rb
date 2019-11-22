# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( explore.scss )
Rails.application.config.assets.precompile += %w( stats.scss )
Rails.application.config.assets.precompile += %w( user_show.scss )
Rails.application.config.assets.precompile += %w( user_preferences.scss )
Rails.application.config.assets.precompile += %w( login.scss )
Rails.application.config.assets.precompile += %w( edit_user_preferences.scss )
Rails.application.config.assets.precompile += %w( admin_edit_user_info.scss )
Rails.application.config.assets.precompile += %w( forgot_password.scss )
Rails.application.config.assets.precompile += %w( show_matches_page.scss )
Rails.application.config.assets.precompile += %w( new_session_registration.scss )
Rails.application.config.assets.precompile += %w( new_club.scss )
Rails.application.config.assets.precompile += %w( interests.scss )

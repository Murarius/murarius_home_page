# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( plane.svg )
Rails.application.config.assets.precompile += %w( plane-shadow.svg )
Rails.application.config.assets.precompile += %w( ground.svg )
Rails.application.config.assets.precompile += %w( ground2.svg )
Rails.application.config.assets.precompile += %w( cloud1.svg )
Rails.application.config.assets.precompile += %w( cloud2.svg )
Rails.application.config.assets.precompile += %w( cloud3.svg )
Rails.application.config.assets.precompile += %w( face.jpg )
Rails.application.config.assets.precompile += %w( plane-red.ico )

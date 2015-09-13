# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '2'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Add bower components folder in /vendor/assets/components to Asset Pipeline
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w[
  octicons/octicons/octicons.eot
  octicons/octicons/octicons-local.ttf
  octicons/octicons/octicons.svg
  octicons/octicons/octicons.woff
  octicons/octicons/octicons.ttf
]

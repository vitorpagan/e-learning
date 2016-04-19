# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.configure do
  config.assets.version = '1.0'
  config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff)$)
  config.assets.paths << Rails.root.join('vendor/assets/components').to_s

  # Bower asset paths
  root.join('vendor', 'assets', 'components').to_s.tap do |bower_path|
    config.sass.load_paths << bower_path
    config.assets.paths << bower_path
  end
  # Precompile Bootstrap fonts
  config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
  # Minimum Sass number precision required by bootstrap-sass
  ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max
end

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

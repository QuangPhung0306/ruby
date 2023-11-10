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
# Rails.application.config.assets.precompile += %w(unit_selections/unit_selection.js
#   unit_selections/load_unit_selection_input.js unit_selections/load_unit_selection_project.js unit_selections/unit_selection_search.js unit_selections/preview_and_print.js 
#   air_mixture/fill_initial_value)

Rails.application.config.assets.precompile += %w(unit_selections/*)
Rails.application.config.assets.precompile += %w(room_calculations/*)
Rails.application.config.assets.precompile += %w(air_mixture/*)
Rails.application.config.assets.precompile += %w(users/select_and_delete_users.js)
Rails.application.config.assets.precompile += %w(handle_projects_table.js)

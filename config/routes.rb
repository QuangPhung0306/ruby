Rails.application.routes.draw do
  require "sidekiq/web"

  mount Sidekiq::Web, at: "/sidekiq"
  devise_for :users, controllers: {sessions: "sessions"}
  root "top_page#show"
  get "/change_status", to: "change_status#update", as: "change_status"
  get "/air_mixture_change_values", to: "air_mixture_change_values#show", as: "air_mixture_change_values"
  put "/password_reset", to: "password_reset#update", as: "password_reset"
  get "/export_csv", to: "export_csv#index", as: "export_csv"
  get "/air_mixture_preview_and_print", to: "air_mixture_preview_and_print#show"
  get "/manual_document", to: "manual_document#show"
  resources :users, only: %i(index create update)
  resources :air_mixtures, only: %i(index create)
  resources :projects, only: %i(index create update)
  resource :room_calculation, only: %i(show create)
  resource :room_calculation_results, only: [:show, :create]
  resource :unit_selection, only: %i(show create)
  namespace :roles do
    resource :users, only: :update
  end
  namespace :send_email do
    resource :users, only: :update
  end
  namespace :batch_deletes do
    resource :users, only: :destroy
  end
  namespace :unit_selection do
    resource :select_category_units, only: :show
    resource :change_textboxs, only: :create
    resource :change_values, only: :create
    resource :search_rotations, only: :create
    resource :convert_air_mixture_results, only: :create
    resource :convert_room_calculation_results, only: :create
  end

  namespace :export_excel do
    resources :unit_selections, only: :create
  end
  
  namespace :preview_and_print do
    resource :unit_selection, only: :show
  end

  namespace :export_csv do
    resources :projects, only: :index
  end
end

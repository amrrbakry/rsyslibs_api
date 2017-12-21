Rails.application.routes.draw do
  namespace :api, path: '' do
    root to: 'misc#status'
    resources :project_dependencies, only: :index
    resources :system_libraries, only: :index
    post 'lookup_syslibs', to: 'lookups#index'
    post 'add_syslibs', to: 'contributions#create'
  end
end

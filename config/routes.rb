Rails.application.routes.draw do
  namespace :api, path: '' do
    post 'lookup_syslibs', to: 'lookups#index'
    post 'add_syslibs', to: 'contributions#create'
  end
end

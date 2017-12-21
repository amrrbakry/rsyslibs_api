Rails.application.routes.draw do
  namespace :api, path: '' do
    post 'lookup_syslibs', to: 'lookups#index'
  end
end

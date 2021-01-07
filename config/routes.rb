Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, default: { format: :js } do
    namespace :v1 do

      post 'upload', to: 'images#upload'

      namespace :contact do
        resources :orders, only: %i[create index]
      end

      namespace :pricing do
        resources :benefits
        resources :mains
        resources :features
      end
      
      namespace :service do
        resources :tiles
      end

      namespace :information do
        resources :tiles
        resources :blocks
      end

      resources :services
      resources :contacts
      resource :auth, only: %i[create]
    end
  end

  #root :to => "application#index"
  get '*path', to: 'application#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  #match "*path", to: "application#index", via: :all
end

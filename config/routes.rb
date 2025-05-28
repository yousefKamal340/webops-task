Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'authentication#signup'
      post '/login', to: 'authentication#login'
      
      resources :posts do
        resources :comments, only: [:create, :update, :destroy]
      end
    end
  end
end 
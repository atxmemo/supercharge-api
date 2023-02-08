Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :api_keys, only: [:create, :destroy, :index]
      resources :open_ai_completion_usages
    end
  end
end

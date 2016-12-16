Rails.application.routes.draw do
  resources :pages
  
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  namespace :api do
    namespace :v1, format: :json do
      resources :pages do
        collection do
          get :get_content
        end
      end
    end
  end
end

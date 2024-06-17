Rails.application.routes.draw do
  resources :lessons
  scope :api do 
    scope :v1 do 
      resources :courses do 
        collection do 
          get :mine
        end

        member do 
          patch :publish
        end
      end

      resources :room_unavailable_times, path: :unavailable_times
      resources :rooms do 
        resources :room_unavailable_times, path: :unavailable_times
      end

      post '/sign_in', to: "auth#login"
      post '/sign_up', to: "users#create"

      namespace :admin do 
        post '/sign_in', to: "auth#login", as: :admin_sign_in

        resources :rooms
        resources :courses do 
          member do 
            patch :approve
            patch :revoke
          end
        end
      end

      resources :admins
      resources :users
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

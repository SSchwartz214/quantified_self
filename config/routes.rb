Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :favorite_foods, only: [:index]
      resources :foods, except: [:new, :edit]
      resources :meals, only: [:index] do
        get 'foods', to: 'meals#show'
        post 'foods/:id', to: 'meals#create'
        delete 'foods/:id', to: 'meals#destroy'
      end
    end
  end
end

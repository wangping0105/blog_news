Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
   }

  root to: 'blogs#index'

  resources :sessions do
    collection do
      post :login
    end
  end
  resources :blogs do
    member do
      post :comment
    end
  end
end

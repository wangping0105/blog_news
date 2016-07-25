Rails.application.routes.draw do
  get 'blogs/index'

  get 'blogs/new'

  get 'blogs/create'

  root 'sessions#index'

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

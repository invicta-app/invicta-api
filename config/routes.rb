Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'

  namespace :api do
    namespace :v1 do
      resources :books
    end
  end

  resources :books do
    resources :sections, only: [:show, :index] do
      member do
        get 'next_section'
        get 'previous_section'
      end
    end
  end
end

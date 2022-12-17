Rails.application.routes.draw do
  namespace :volumes do
    namespace :api do
      namespace :v1 do
        resources :books
      end
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

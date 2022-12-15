Rails.application.routes.draw do
  namespace :volumes do
    namespace :api do
      namespace :v1 do
        resources :books
      end
    end
  end

  namespace :books do
    resources :content, only: [:index, :show]
    resources :section, only: [:index, :show]
  end
end

Rails.application.routes.draw do
  namespace :volumes do
    namespace :api do
      namespace :v1 do
        resources :books
      end
    end
  end
end

Rails.application.routes.draw do
  resources :categories
  resources :items do
  	resources :requests
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'test-shacip', to: 'test_shacip#show'
  devise_for :users
end

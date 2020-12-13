Rails.application.routes.draw do
  post :user_token, to: 'user_token#create'
  resource :user
  
  resource :cart do
    post :add, on: :member
  end

  resources :products

  resources :orders
end

Rails.application.routes.draw do
  resources :receipts, only: [:index, :show]
  post '/receipts/new', to: 'receipts#create'
end

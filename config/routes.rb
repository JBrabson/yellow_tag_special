Rails.application.routes.draw do
  get '/receipts', to: 'receipts#index'
  get '/receipts/:id', to: 'receipts#show'
  post '/receipts/new', to: 'receipts#create'
end

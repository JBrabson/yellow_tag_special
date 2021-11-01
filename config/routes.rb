Rails.application.routes.draw do
  get '/receipts', to: 'receipts#index'
end

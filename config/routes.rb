Rails.application.routes.draw do
  root to: 'texts#new'

  resources :texts, only: %i[create show], param: :url
end

Rails.application.routes.draw do
  root to: 'snippets#new'

  get '/text/:token', to: redirect('/s/%{token}')
  resources :s, only: %i[create show], param: :token, controller: :snippets, as: :snippets
end

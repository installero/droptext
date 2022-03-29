Rails.application.routes.draw do
  root to: 'snippets#new'

  get '/texts/:token', to: redirect('/s/%{token}')
  resources :s, only: %i[create show], param: :token, controller: :snippets, as: :snippets
end

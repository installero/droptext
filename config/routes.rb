Rails.application.routes.draw do
  root to: 'snippets#new'

  get '/text/:token', to: redirect('/t/%{token}')
  resources :t, only: %i[create show], param: :token, controller: :snippets, as: :snippets
end

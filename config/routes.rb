Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resources :categories, only: [:index, :show, :create, :new]
  resources :articles, only: [:new, :create, :show]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/votearticle/:id', to: 'articles#vote_article', as: :votearticle
  get '/unvotearticle/:id', to: 'articles#unvote_article', as: :unvotearticle
  root 'categories#index'
end

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'static', to: "static#index" #page d'accueil
  get 'static/team', to: "static#team"
  get 'static/contact', to: "static#contact"
  get 'static/gossip/:id', to: "static#show_gossip" # page du gossip
  get 'static/autor/:autor', to: "static#show_autor" # page de l'auteur
  get 'welcome/:name', to: "welcome#name" # page secrete

  resources :static, only: [:new, :create, :edit, :update, :destroy] do
    resources :comments
    resources :likes
  end
  resources :cities
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end

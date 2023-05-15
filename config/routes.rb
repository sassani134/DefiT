Rails.application.routes.draw do

  resources :tournaments do
    get '/classement', to: 'tournament#classement', as: 'classement'
    resources :matches
  end
  get 'tournaments/:id/generateMatches', to: 'tournaments#generateMatches', as: 'generateMatches'
    get 'tournaments/random', to: 'tournament#random_tournament'
  resources :teams
  resources :players

  root "teams#index"
end

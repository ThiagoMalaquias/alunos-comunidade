Rails.application.routes.draw do
  resources :alunos
  resources :admins
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match '/alunos', to: 'application#options', via: :options


end

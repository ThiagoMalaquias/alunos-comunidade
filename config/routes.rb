Rails.application.routes.draw do
  resources :alunos
  resources :admins

  root to: "home#index"

  get '/elements', to: "home#elements"
  get '/generic', to: "home#generic"

  #==================== API ============================================================
  match '/alunos', to: 'application#options', via: :options
  match "/serviceworker.js", to: 'application#options', via: [:get, :post]

end

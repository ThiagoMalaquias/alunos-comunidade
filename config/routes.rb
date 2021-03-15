Rails.application.routes.draw do
  resources :administradors
  resources :alunos

  root to: "home#index"

  get '/vencimentos', to: "home#vencimentos"
  get '/atrasados', to: "home#atrasados"
  
  get '/login', to: "login#index"
  post '/logar', to: "login#logar"
  get '/sair', to: "login#deslogar"

  #==================== API ============================================================
  match '/alunos', to: 'application#options', via: :options
  match "/serviceworker.js", to: 'application#options', via: [:get, :post]

end

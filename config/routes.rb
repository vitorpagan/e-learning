Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    users: 'users',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :users, path: 'usuarios'
    resources :courses, path: 'modulos'
    resources :categories, path: 'categorias'
    resources :video_classes, path: 'aulas'
    resources :professionals, path: 'profissionais'
    resources :public_targets, path: 'publicos-alvos'
    resources :prerequisites, path: 'pre-requisitos'
    resources :orders, only: :index, path: 'pedidos'
    resources :logs, only: :index
  end

  resources :courses, path: 'modulos', only: [:show, :index] do
    resources :video_classes, path: 'aulas', only: [:show, :index]
    get '/certificado', as: 'certificate', to: 'certificates#show'
    post '/filter', on: :collection, to: 'courses#filter'
  end

  resource :shopping_cart, only: [:show], path: 'carrinho' do
    get 'add_course', to: 'shopping_carts#add_course'
    get 'add_video_class', to: 'shopping_carts#add_video_class'
    get 'get_items', to: 'shopping_carts#get_items'
    post 'checkout', to: 'shopping_carts#checkout'
    resources :shopping_cart_items, path: 'items', as: 'items', only: :destroy do
      get '/adicionar', to: 'shopping_cart_items#add'
    end
    get 'sucesso', to: 'shopping_carts#success', as: 'success'
    get 'instrucao_unica', to: 'shopping_carts#moip_instruction', as: 'moip_instruction'
  end

  get '/perfil', as: 'profile', to: 'users#show'

  get '/home', as: 'temp', to: 'home#temp'

  get '/', as: 'home', to: 'home#index'

  get 'about_us', to: 'pages#about_us', path: 'sobre-o-educacao-beleza'

  get 'about_persil', to: 'pages#about_persil', path: 'nosso-embaixador-paulo-persil'

  get 'my_video_classes', to: 'pages#my_video_classes', path: 'minhas-aulas'

  get 'tops_tips', to: 'pages#tops_tips', path: 'dicas-dos-tops'

  get 'contact', to: 'contacts#new', path: 'contato'
  resources "contacts", only: [:new, :create]

  get 'privacy_policy', to: 'pages#privacy_policy', path: 'politica-de-privacidade'

  get 'terms_use', to: 'pages#terms_use', path: 'termos-de-uso'

  get 'faq', to: 'pages#faq', path: 'perguntas-frequentes'

  get 'all_classes', to: 'video_classes#all_classes', path: 'lista-aulas'

  post :moip_postback, to: 'moip_gateway#postback'

  resources :users, only: :show do
    get "search_address/(:zipcode)" => "users#search_address", as: "search_address", on: :collection
  end

  resources :orders, only: :index
end
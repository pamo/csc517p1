Csc517p1::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  root :to => 'home#index', :as => 'home'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users do
    resources :posts, :only => [:new, :create, :show, :index, :destroy]
  end

  get 'posts/index'
  get 'posts/show'
  get 'posts/new'

  match 'posts/search',   :to => 'posts#search'

  get 'admin' => 'admin#index'

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"

end

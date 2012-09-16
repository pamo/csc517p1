Csc517p1::Application.routes.draw do
  root :to => 'home#index', :as => 'home'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :posts
  resources :categories
  resources :comments
  resources :users #, :users => {:search => :get}
  resources :searches

  get 'posts' => 'posts#index'
  # more search modifications
  get 'posts/show'
  get 'posts/new'
  match 'posts/search',   :to => 'posts#search'
  # resources :posts, :posts => {:search => :get}

  match 'users/search',  :to => 'users#search'

  get 'comments' => 'comments#index'
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  match 'comments/new(/:post_id)' => 'comments#new', :as => :new_comment


  get 'admin' => 'admin#index'

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"

end
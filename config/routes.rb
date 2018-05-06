Rails.application.routes.draw do
  root "pages#home"
  
  devise_for :users
  devise_scope :user do
    get "signup", to: "registrations#new"
    post "signup", to: "registrations#create"
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end

  resources :users, only: :create do 
    resources :resumes
    resources :jobs
  end

  resources :jobs, only: [:index, :show] do
    member do
      get :apply, to: "jobs#apply"
      post :apply, to: "jobs#create_apply"
    end
  end
  resources :resumes, only: [:index, :show]
  resources :manager_jobs, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :user_contacts, only: [:create]

  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/help", to: "pages#help"
  get "/blog", to: "pages#blog"
  get "/blog-post", to: "pages#blog-post"
  get "/pricing", to: "pages#pricing"
  get "/manager-resumes", to: "manager_resumes#index"
  get "search", to: "search#search"
  get "search-resume", to: "search_resume#search"
  get :qsearch, to: "qsearch#search"

end

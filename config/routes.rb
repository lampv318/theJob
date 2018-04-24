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

  resources :users do 
    resources :resumes
    resources :jobs, only: [:new, :create, :index]
  end

  resources :jobs, only: [:index]

  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/help", to: "pages#help"
  get "/blog", to: "pages#blog"
  get "/blog-post", to: "pages#blog-post"
  get "/pricing", to: "pages#pricing"
end

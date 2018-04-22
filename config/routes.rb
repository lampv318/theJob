Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/help", to: "pages#help"
  get "/blog", to: "pages#blog"
  get "/blog-post", to: "pages#blog-post"
  get "/pricing", to: "pages#pricing"
end

Rails.application.routes.draw do
  get 'threat/name'
  post 'threat/contact'
  get 'threat/contact'
  post 'threat/severity'
  get 'threat/severity'
  post 'threat/preview'
  post 'threat/display'
  get 'threat/display'
  # First, the index page, which is where the user will arrive by default (by visiting "http://localhost:3000/")
  get 'home/index', to: 'home#index'
  root to: 'home#index'
end

Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#index'
  resources :article_categories
  resources :articles
end

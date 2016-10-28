Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :article_categories
  resources :articles
end

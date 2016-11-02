Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#index'
  resources :article_categories do
    collection do
      get :show_index
    end
  end
  resources :articles
end

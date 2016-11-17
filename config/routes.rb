Rails.application.routes.draw do

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

  resources :article_categories do
    collection do
      get :show_index
      get :main_index
      get :main_about
    end
  end

  resources :articles do
    collection do
      get :cartogram
      get :main_index
    end
  end

  root to: 'articles#index'

  resources :todos do
    collection do
      get :list
    end
  end

end

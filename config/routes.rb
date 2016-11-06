Rails.application.routes.draw do

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

  resources :article_categories do
    collection do
      get :show_index
    end
  end

  resources :articles do
    collection do
      get :cartogram
    end
  end

  root to: 'article_categories#show_index'

end

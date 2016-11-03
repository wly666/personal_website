Rails.application.routes.draw do

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

  resources :article_categories do
    collection do
      get :show_index
    end
  end

  resources :articles

  root to: 'article_categories#show_index'

end

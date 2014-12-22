Rails.application.routes.draw do

  get 'bills/new'

  get 'bills/edit'

  root 'static_pages#index'

  get 'about' => 'static_pages#about'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :index] do
  	resources :bills, only: [:new, :edit]
  end

end

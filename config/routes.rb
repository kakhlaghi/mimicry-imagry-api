Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :images, except: [:new, :edit]
    #resources :users, only: [:create]
    post 'user_token' => 'user_token#create'

  end

end

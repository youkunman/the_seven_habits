Rails.application.routes.draw do
  root 'roots#top'
  get '/about', to: 'roots#about'
  devise_for :users
  resources :users, except:[:new]
  resources :habits, excpt:[:show] do
    resource :experiences, only:[:create, :destroy]
end

  # get 'experiences/index'
  # get 'experiences/show'
  # get 'experiences/create'
  # get 'experiences/destroy'
  # get 'habits/index'
  # get 'habits/new'
  # get 'habits/edit'
  # get 'habits/update'
  # get 'habits/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'roots/show'
  # get 'roots/index'
  # get 'roots/new'
  # get 'roots/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


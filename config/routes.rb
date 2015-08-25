Rails.application.routes.draw do
  devise_for :users
  root 'shows#index'

  resource :shows
  patch 'shows/edit'
end

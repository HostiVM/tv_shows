Rails.application.routes.draw do
  root 'shows#index'

  devise_for :users
end

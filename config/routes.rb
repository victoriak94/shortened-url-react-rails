Rails.application.routes.draw do
  get 'link/index'
  get 'link/show'

  root 'links#index'
  resources :link

  get '/:short_url', to: 'link#send_to_url'
end

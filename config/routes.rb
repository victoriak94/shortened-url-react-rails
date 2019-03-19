Rails.application.routes.draw do
  # root to: 'shortened_urls#index'
  # get "/:short_url", to: "shortened_urls#show"
  # get "shortened/:short_url", to: "shortened_urls#shortened", as: :shortened
  # resources :shortened_urls
  # get "/shortened_urls/fetch_original_url"

  get 'link/index'
  get 'link/show'

  root 'links#index'
  resources :link

  get '/:short_url', to: 'link#send_to_url'
end

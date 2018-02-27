Rails.application.routes.draw do
  root to: "songs#index"

  resources :songs, only: [:index] do
    get "search", on: :collection
  end
end
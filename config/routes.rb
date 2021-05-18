Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
     
      # Articles
      get "articles", to: "articles#index"
      get "articles/:id", to: "articles#show"
      put "articles/:id", to: "articles#update"
      post "articles", to: "articles#create"
      delete "articles/:id", to: "articles#destroy"

      # Authors
      get "authors", to: "authors#index"

    end
  end
end

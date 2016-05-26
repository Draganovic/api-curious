Rails.application.routes.draw do
  root "home#show"

    delete "/logout",                to: "sessions#destroy"

    get "/repos",                  to: "repos#index"
    get "/orgs",                   to: "orgs#index"
    get "/events",                 to: "events#index"
    get "/actions",             to: "actions#index"
    get '/auth/github', as: :github_login
    get '/auth/github/callback', to: "sessions#create"

end

Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root 'links#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

#links routes
  get "/links", to: "links#index"
  get "/links/new", to: "links#new"
  post "/links", to: "links#create"
  get "/links/:slug", to: "links#show"

#vists routes
  get "/:slug", to: "visits#create"

  
end

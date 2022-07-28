Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'

  # Route for API calls
  # get 'search/index'
  get '/search' => 'search#index', :as => 'search'
  

#                 Prefix Verb   URI Pattern                                     Controller#Action
#                 search GET    /search(.:format)                               search#index
#                   root GET    /                                               static_pages#root
#              api_users POST   /api/users(.:format)                            api/users#create {:default=>{:format=>:json}}
#               api_user GET    /api/users/:id(.:format)                        api/users#show {:default=>{:format=>:json}}
#                        PATCH  /api/users/:id(.:format)                        api/users#update {:default=>{:format=>:json}}
#                        PUT    /api/users/:id(.:format)                        api/users#update {:default=>{:format=>:json}}
#             api_hotels GET    /api/hotels(.:format)                           api/hotels#index {:default=>{:format=>:json}}
#              api_hotel GET    /api/hotels/:id(.:format)                       api/hotels#show {:default=>{:format=>:json}}
#              api_rooms GET    /api/rooms(.:format)                            api/rooms#index {:default=>{:format=>:json}}
#       api_reservations GET    /api/reservations(.:format)                     api/reservations#index {:default=>{:format=>:json}}
#                        POST   /api/reservations(.:format)                     api/reservations#create {:default=>{:format=>:json}}
#        api_reservation GET    /api/reservations/:id(.:format)                 api/reservations#show {:default=>{:format=>:json}}
#                        PATCH  /api/reservations/:id(.:format)                 api/reservations#update {:default=>{:format=>:json}}
#                        PUT    /api/reservations/:id(.:format)                 api/reservations#update {:default=>{:format=>:json}}
#                        DELETE /api/reservations/:id(.:format)                 api/reservations#destroy {:default=>{:format=>:json}}
#            api_reviews GET    /api/reviews(.:format)                          api/reviews#index {:default=>{:format=>:json}}
#                        POST   /api/reviews(.:format)                          api/reviews#create {:default=>{:format=>:json}}
#             api_review GET    /api/reviews/:id(.:format)                      api/reviews#show {:default=>{:format=>:json}}
#                        PATCH  /api/reviews/:id(.:format)                      api/reviews#update {:default=>{:format=>:json}}
#                        PUT    /api/reviews/:id(.:format)                      api/reviews#update {:default=>{:format=>:json}}
#                        DELETE /api/reviews/:id(.:format)                      api/reviews#destroy {:default=>{:format=>:json}}
#            api_session DELETE /api/session(.:format)                          api/sessions#destroy {:default=>{:format=>:json}}
#                        POST   /api/session(.:format)                          api/sessions#create {:default=>{:format=>:json}}

  namespace :api, default: { format: :json } do
    resources :users, only: [:show, :create, :update]
    resources :hotels, only: [:index, :show]
    resources :rooms, only: [:index]
    resources :reservations, only: [:index, :show, :create, :update, :destroy]
    resources :reviews, only: [:index, :show, :create, :update, :destroy]
    resource :session, only: [:create, :destroy]
  end

end

Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  root to: redirect('/tickets')
  devise_for :users
  resources :tickets do
    match 'answer', to: 'tickets#answer', as: :answer, via: [:get, :post]
    get 'open_close', to: 'tickets#open_close', as: :open_close
  end
  resources :spool

  post 'assign_tick_to_admin', to: 'spool#assign_tick_to_admin'
  get 'to_french', to: 'application#to_french', as: :to_french
  get 'to_english', to: 'application#to_english', as: :to_english

end

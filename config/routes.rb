Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    get 'listing', to: 'items#listing'
    get 'check_price', to: 'items#check_price'
    get 'update_price/:id', to: 'items#update_price'
  end

end

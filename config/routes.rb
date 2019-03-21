Rails.application.routes.draw do
  resources :coupons, :only [:create, :new, :show, :index]

end

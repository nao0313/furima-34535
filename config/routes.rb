Rails.application.routes.draw do
  get 'items/index'
  root to: "users#index"
end

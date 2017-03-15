Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
  get 'drinks' => 'static#choose'
  get 'drink/:id' => 'static#show', as: 'drink'
  get 'random' => 'static#random'
  get 'mix'=> 'static#mix'
  get 'choose'=> 'static#choose'

  post 'search' => 'static#search'
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get ':slug' => 'application#show', as: 'document', slug: /[a-z0-9]{1,8}/
  post 'add' => 'application#create', format: false
  root 'application#index'
end

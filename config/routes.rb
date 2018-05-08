Rails.application.routes.draw do
  namespace :admin, path: '/', format: false do
    match '🔒', to: 'application#login', as: 'users', via: [:get, :post]
    get '@', to: redirect('/%F0%9F%94%93')
    get '🔓', to: 'application#index', as: 'dashboard'
  end
  get ':slug' => 'application#show', as: 'document', slug: /[a-z0-9]{1,8}/
  post 'add' => 'application#create', format: false
  root 'application#index'
end

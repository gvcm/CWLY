Rails.application.routes.draw do
  namespace :admin, path: '/', format: false do
    match '🔒', to: 'application#login', as: 'users', via: [:get, :post]
    get '🔓', to: 'application#index', as: 'dashboard'
  end
  get ':slug' => 'application#show', slug: /[a-z0-9]{1,8}/
  post 'add' => 'application#create', format: false
  get ':default' => 'application#index', format: false, default: /.*/
end

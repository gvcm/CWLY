Rails.application.routes.draw do
  root 'application#index'
  get ':slug' => 'application#show'
  post 'add' => 'application#create'
end

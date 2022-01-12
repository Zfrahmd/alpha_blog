Rails.application.routes.draw do
  root 'pages#home'

  # use only selective routes from resource article
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  # use all routes from articles except destroy
  resources :articles, except: [:destroy]
  
  # create custom routes for destroy
  # name_route 'route_url' => controller#function, as: defining_path_text
  delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'
  

end

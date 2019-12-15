Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  post 'contact' => 'static_pages#create', as: 'create_message'

  get 'discussiontopics' => 'discussiontopics#index'
  get 'discussiontopics/:id' => 'discussiontopics#show', as: 'discussiontopics_discussions'

  get 'discussions/:id' => 'discussions#show', as: 'discussion'
  get 'discussions/:id/edit' => 'discussions#edit', as: 'edit_discussion'
  patch 'discussions/:id' => 'discussions#update'
  get 'discussions/new/:discussiontopicid' => 'discussions#new', as: 'new_discussion'
  post 'discussions' => 'discussions#create'
  delete 'discussions/:id' => 'discussions#destroy'

  get '/comments/new/:discussionid' => 'comments#new'
  post 'comments' => 'comments#create'
  get 'comments/:id/edit' => 'comments#edit'
  patch 'comments/:id' => 'comments#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

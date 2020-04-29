Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  namespace :admins do
    root :to => 'dashboard#index'
    resources :contacts, :only => [:index, :show, :destroy]
		resources :banners
		resources :articles
		resources :categories
		resources :galleries
		resources :facilities
		resources :horses
		resources :instructors
		resources :testimonials
		resources :links
		resources :bookings
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# Info & Static page
	match 'about', to: 'home#about', via: :get, as: :about
	match 'services', to: 'home#services', via: :get, as: :services
	match 'event', to: 'home#event', via: :get, as: :event
	match 'general', to: 'home#general', via: :get, as: :general
	match 'terms', to: 'home#terms', via: :get, as: :terms
	match 'privacy', to: 'home#privacy', via: :get, as: :privacy

	# articles
	match 'news', to: 'articles#index', via: :get, as: :news
	match 'news/:id', to: 'articles#show', via: :get, as: :get_news

	resource :booking, :only => [:show, :new, :create]
	resources :horses, :only => [:index, :show]
	resources :facilities, :only => [:index, :show]
	resource :contact, :only => [:show, :create]
	root :to => "home#index"
end

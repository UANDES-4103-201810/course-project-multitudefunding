Rails.application.routes.draw do
  resources :categories
	resources :projects do
    get 'approve', :on => :member
		resources :promises
  end
	post 'projects/fund'
	post 'promises/buy'
	devise_for :users
	get 'user/show_owned'
	get 'user/show_funded'
  	get 'user/show_profile'
    get 'user/show_bought'

	get 'admin_categories' => 'admin#admin_categories'
  get 'admin_users' => 'admin#admin_users'
  get 'admin_new_user' => 'admin#new_user'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'home/index'
	root 'home#index'
end

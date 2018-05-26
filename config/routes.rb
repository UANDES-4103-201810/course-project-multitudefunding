Rails.application.routes.draw do
  resources :categories
	resources :projects do
		resources :promises
  end
	get 'project/show_project'
	get 'admin_categories' => 'admin#admin_categories'
	devise_for :users
	get 'user/show_owned'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'home/index'
	root 'home#index'
end

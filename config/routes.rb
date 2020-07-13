Rails.application.routes.draw do
	root to: "home#index"
	
  devise_for :admins
  devise_for :users

  resources :scheduled_emails
  resources :smtp_settings
end

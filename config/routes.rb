Rails.application.routes.draw do
  get 'profile/edit_profile'
  get 'password/forgot_password'

  post 'account/signup'
  get 'account/index'
  post 'account/login'
  get 'account/dashboard'
  get 'account/logout'
  get 'password/forgot_password'
  post 'password/forgot_password'
  get 'password/reset_password'
  post 'password/reset_password'
  post 'profile/edit_profile'

  root to: redirect('account/index')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

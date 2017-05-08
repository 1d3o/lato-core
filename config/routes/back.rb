# main routes
get 'login', to: 'back/authentication#index', as: 'login'
get 'dashboard', to: 'back/dashboard#index', as: 'dashboard'

# authentication
post 'authentication/exec_login', to: 'back/authentication#exec_login', as: 'authentication_exec_login'
post 'authentication/exec_logout', to: 'back/authentication#exec_logout', as: 'authentication_exec_logout'

# superusers
resources :superusers, module: 'back'
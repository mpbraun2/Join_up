Rails.application.routes.draw do
root 'users#index'
# *************************************************************
# users routes
# *************************************************************
  get '/users/login' => 'users#new' #show login page
  get '/success' => 'users#show' #showing a success page to check if login/reg works

  post '/users' => 'users#create' #process the new user

  get '/logout' => 'users#logout' #logout the user

  post '/users/authenticate' => 'users#authenticate' #authenticate the login form 

  get '/users/:id/edit' => 'users#edit' #sends to user profile update page

  patch '/users/:id' => 'users#update' #processes the changes to user profile.

# *************************************************************
# organizations routes
# *************************************************************
  get '/organizations' => 'organizations#index' #show all organizations

  post '/organizations' => 'organizations#create' #process the new organization

  get '/organizations/:id' => 'organizations#show' #shows a specific event tied to ID.

  delete '/organizations/:id' => 'organizations#destroy' # deletes a organization

  post '/organizations/:id/join' => 'organizations#join' #join an organization

end

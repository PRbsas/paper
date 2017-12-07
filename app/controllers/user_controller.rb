class UserController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login'
  end
end

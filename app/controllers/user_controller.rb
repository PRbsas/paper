class UserController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/signup' do
    if params.none? { |k, v| v.blank? }
      user = User.create(username: params[:username], password: params[:password])
      user.save
      session[:user_id] = user.id
      redirect '/notebooks'
    else
      redirect '/signup'
    end
  end

  post '/login' do
    redirect '/notebooks' if logged_in?

    user = User.find_by(username: paramas[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/notebooks'
    else
      erb :'/users/login'
    end 
  end
end

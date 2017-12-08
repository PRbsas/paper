class NotebookController < ApplicationController

  get '/notebooks' do
    if logged_in?
      @notebooks = current_user.notebooks.all
      erb :'/notebooks/notebooks' 
    else
      redirect '/login'
    end
  end
end

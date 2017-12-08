class NotebookController < ApplicationController

  get '/notebooks' do
    if logged_in?
      @notebooks = Notebook.all #current_user.notebooks.all
      erb :'/notebooks/notebooks'
    else
      redirect '/login'
    end
  end

  get '/notebooks/new' do
    erb :'/notebooks/create_notebook'
  end

  post '/notebooks' do
    @notebook = current_user.notebooks.create(title: params[:title], description: params[:description]) unless params[:title].empty?
    if @notebook
      redirect "notebooks/#{@notebook.id}"
    else
      redirect '/notebooks/new'
    end
  end
end

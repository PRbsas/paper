class NotebookController < ApplicationController

  get '/notebooks' do
    if logged_in?
      @notebooks = current_user.notebooks.all
      erb :'/notebooks/notebooks'
    else
      redirect '/login'
    end
  end

  get '/notebooks/new' do
    erb :'/notebooks/create_notebook'
  end

  get '/notebooks/:id' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/notebooks/show_notebook'
    else
      redirect '/'
    end
  end

  get '/notebooks/:id/edit' do
    if logged_in?
      @notebook = current_user.notebooks.find_by_id(params[:id])
      erb :'/notebooks/edit_notebook'
    else
      redirect '/login'
    end
  end

  post '/notebooks' do
    @notebook = current_user.notebooks.create(title: params[:title], description: params[:description]) unless params[:title].empty?
    if @notebook
      redirect "/notebooks/#{@notebook.id}"
    else
      redirect '/notebooks/new'
    end
  end

  patch '/notebooks/:id' do
    @notebook = current_user.notebooks.find_by_id(params[:id])
    if logged_in? && !params[:title].empty?
      @notebook.title = (params[:title])
      @notebook.description = (params[:description])
      @notebook.save
      redirect "/notebooks/#{@notebook.id}"
    else
      redirect "/notebooks/#{@notebook.id}/edit"
    end
  end
end

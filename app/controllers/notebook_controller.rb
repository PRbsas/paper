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
    if logged_in?
      erb :'/notebooks/create_notebook'
    else
      redirect '/login'
    end
  end

  get '/notebooks/:slug' do
    if logged_in?
      @notebooks = current_user.notebooks.all
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/notebooks/show_notebook'
    else
      redirect '/'
    end
  end

  get '/notebooks/:slug/edit' do
    if logged_in?
      @notebooks = current_user.notebooks.all
      @notebook = current_user.notebooks.find_by_slug(params[:slug])
      erb :'/notebooks/edit_notebook'
    else
      redirect '/login'
    end
  end

  post '/notebooks' do
    @notebook = current_user.notebooks.create(title: params[:title], description: params[:description]) unless params[:title].empty?
    if @notebook
      redirect "/notebooks/#{@notebook.slug}"
    else
      redirect '/notebooks/new'
    end
  end

  patch '/notebooks/:slug' do
    @notebook = current_user.notebooks.find_by_slug(params[:slug])
    if logged_in? && !params[:title].empty?
      @notebook.title = (params[:title])
      @notebook.description = (params[:description])
      @notebook.save
      redirect "/notebooks/#{@notebook.slug}"
    else
      redirect "/notebooks/#{@notebook.slug}/edit"
    end
  end

  delete '/notebooks/:slug/delete' do
    @notebook = current_user.notebooks.find_by_slug(params[:slug])
    if @notebook && logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      @notebook.tasks.destroy
      @notebook.bookmarks.destroy
      @notebook.notes.destroy
      @notebook.destroy
      redirect '/notebooks'
    else
      redirect '/login'
    end
  end
end

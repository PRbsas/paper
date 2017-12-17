class AssetController < ApplicationController

  get '/notebooks/:slug/notes/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/notes/create_note'
    else
      redirect '/login'
    end
  end

  get '/notebooks/:slug/bookmarks/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/bookmarks/create_bookmark'
    else
      redirect '/login'
    end
  end

  get '/notebooks/:slug/tasks/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/tasks/create_task'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:slug' do
    @notebook = Notebook.find_by_slug(params[:slug])
    if params[:name]
      @task = Task.new(name: params[:name]) unless params[:name].empty?
      @task.save
      @notebook.tasks << @task
      redirect "/notebooks/#{@notebook.slug}"
    elsif params[:content]
      @note = Note.new(content: params[:content]) unless params[:content].empty?
      @note.save
      @notebook.notes << @note
      redirect "/notebooks/#{@notebook.slug}"
    elsif params[:link]
      @bookmark = Bookmark.new(link: params[:link]) unless params[:link].empty?
      @bookmark.save
      @notebook.bookmarks << @bookmark
      redirect "/notebooks/#{@notebook.slug}"
    end
  end
end

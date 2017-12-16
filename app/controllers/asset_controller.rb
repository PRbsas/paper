class AssetsController < ApplicationController

  get '/notebooks/:id/notes/new' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/notes/create_note'
    else
      redirect '/login'
    end
  end

  get '/notebooks/:id/bookmarks/new' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/bookmarks/create_bookmark'
    else
      redirect '/login'
    end
  end

  get '/notebooks/:id/tasks/new' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/tasks/create_task'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:id' do
    @notebook = Notebook.find_by_id(params[:id])
    if params[:name]
      @task = Task.new(name: params[:name]) unless params[:name].empty?
      @task.save
      @notebook.tasks << @task
      redirect "/notebooks/#{@notebook.id}"
    elsif params[:content]
      @note = Note.new(content: params[:content]) unless params[:content].empty?
      @note.save
      @notebook.notes << @note
      redirect "/notebooks/#{@notebook.id}"
    elsif params[:link]
      @bookmark = Bookmark.new(link: params[:link]) unless params[:link].empty?
      @bookmark.save
      @notebook.bookmarks << @bookmark
      redirect "/notebooks/#{@notebook.id}"
    end
  end
end

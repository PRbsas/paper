class BookmarkController < ApplicationController

  get '/notebooks/:id/bookmarks/new' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/bookmarks/create_bookmark'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:id' do
    @notebook = Notebook.find_by_id(params[:id])
    if params[:link]
      @bookmark = Bookmark.new(link: params[:link]) unless params[:link].empty?
      @bookmark.save
      @notebook.bookmarks << @bookmark
      redirect "/notebooks/#{@notebook.id}"
    end 
  end
end

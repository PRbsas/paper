class BookmarkController < ApplicationController

  get '/notebooks/:slug/bookmarks/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/bookmarks/create_bookmark'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:slug/bookmarks' do
    @notebook = Notebook.find_by_slug(params[:slug])
    if params[:link]
      @bookmark = Bookmark.new(link: params[:link]) unless params[:link].empty?
      @bookmark.save
      @notebook.bookmarks << @bookmark
      redirect "/notebooks/#{@notebook.slug}"
    end
  end
end

class NoteController < ApplicationController

  get '/notebooks/:slug/notes/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/notes/create_note'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:slug/notes' do
    @notebook = Notebook.find_by_slug(params[:slug])
    if params[:content]
      @note = Note.new(content: params[:content]) unless params[:content].empty?
      @note.save
      @notebook.notes << @note
      redirect "/notebooks/#{@notebook.slug}"
    end
  end
end

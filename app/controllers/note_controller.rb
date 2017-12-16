class NoteController < ApplicationController

  get '/notebooks/:id/notes/new' do
    if logged_in?
      @notebook = Notebook.find_by_id(params[:id])
      erb :'/notes/create_note'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:id' do
    @notebook = Notebook.find_by_id(params[:id])
    if params[:content]
      @note = Note.new(content: params[:content]) unless params[:content].empty?
      @note.save
      @notebook.notes << @note
      redirect "/notebooks/#{@notebook.id}"
    end
  end
end

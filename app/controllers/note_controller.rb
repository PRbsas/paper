class NoteController < ApplicationController

  get '/notebooks/notes/new' do
    if logged_in?
      erb :'/notes/create_note'
    else
      redirect '/login'
    end
  end
end

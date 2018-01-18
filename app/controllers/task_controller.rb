class TaskController < ApplicationController

  get '/notebooks/:slug/tasks/new' do
    if logged_in?
      @notebook = Notebook.find_by_slug(params[:slug])
      erb :'/tasks/create_task'
    else
      redirect '/login'
    end
  end

  post '/notebooks/:slug/tasks' do
    @notebook = Notebook.find_by_slug(params[:slug])
    if params[:name]
      @task = Task.new(name: params[:name]) unless params[:name].empty?
      @task.save
      @notebook.tasks << @task
      redirect "/notebooks/#{@notebook.slug}"
    end
  end
end

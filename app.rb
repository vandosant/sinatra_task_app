require 'sinatra/base'

class App < Sinatra::Application
  TASKS = []

  get '/' do
    erb :index
  end

  post '/' do
    TASKS << params[:new_task]
    redirect to '/'
  end
end
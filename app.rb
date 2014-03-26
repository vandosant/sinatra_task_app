require 'sinatra'

class App < Sinatra::Application
  set :tasks, []

  get '/' do
    erb :index, locals: {:tasks => settings.tasks}
  end

  get '/add' do
    erb :add
  end

  post '/' do
    settings.tasks << params[:new_task]
    redirect '/'
  end
end
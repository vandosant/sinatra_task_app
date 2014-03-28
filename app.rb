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

  get '/:id' do
    my_id = params[:id]
    my_item = settings.tasks[params[:id].to_i]
    erb :show, locals: {:id => my_id, :item => my_item}
  end
end
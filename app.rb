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

  delete '/:id' do
    my_index = params[:id].to_i
    settings.tasks.delete_at(my_index)
    redirect '/'
  end

  get '/:id' do
    my_id = params[:id]
    my_item = settings.tasks[params[:id].to_i]
    erb :show, locals: {:id => my_id, :item => my_item}
  end

  post '/show/:id' do
    my_id = params[:id].to_i
    settings.tasks[my_id] = params[:renamed_task]
    redirect '/'
  end
end
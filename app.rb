require 'sinatra/base'

class App < Sinatra::Application
  ITEMS = []

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/' do
    ITEMS << params[:new_item]
    redirect '/'
  end
end
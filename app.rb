require 'sinatra/base'

class App < Sinatra::Application
  get '/' do
    "welcome"
  end
end
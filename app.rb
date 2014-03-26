require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "welcome"
  end
end
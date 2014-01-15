require 'bundler'
Bundler.require

require './lib/spacecat'
set :database, "sqlite3:///localhost"

class App < Sinatra::Application

  get '/' do
    @spacecats = Spacecat.all
    haml :index
  end

  get '/new' do
    haml :new
  end

end
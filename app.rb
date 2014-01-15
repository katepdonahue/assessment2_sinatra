require 'bundler'
Bundler.require

require './lib/spacecat'
set :database, "sqlite3:///localhost"

class App < Sinatra::Application

  get '/' do
    @spacecats = SpaceCat.all
  end

end
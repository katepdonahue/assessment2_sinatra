require 'bundler'
Bundler.require

require './lib/spacecat'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'sinatra_application.sqlite3.db'
)
set :database, "sqlite3:///localhost"

class App < Sinatra::Application

  get '/' do
    @spacecats = Spacecat.all
    haml :index
  end

  get '/new' do
    haml :new
  end

  post '/create' do
    @spacecat = Spacecat.new
    @spacecat.name = params["name"]
    @spacecat.planet = params["planet"]
    @spacecat.tagline = params["tagline"]
    @spacecat.superpower = params["superpower"]
    debugger
    @spacecat.save
    haml :show
  end

end
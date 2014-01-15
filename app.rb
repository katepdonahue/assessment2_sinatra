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

  get '/:id' do
    @spacecat = Spacecat.find(:id)
    haml :show
  end

  get '/:id/edit' do
    @spacecat = Spacecat.find(:id)
    haml :edit
  end

  post '/:id' do
    @spacecat = Spacecat.find(:id)
    @spacecat.name = params["name"]
    @spacecat.planet = params["planet"]
    @spacecat.tagline = params["tagline"]
    @spacecat.superpower = params["superpower"]
    haml :show
  end

  delete '/:id' do
    Spacecat.find(:id).destroy
    haml :index
  end

end
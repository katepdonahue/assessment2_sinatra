require 'bundler'
Bundler.require

require './lib/spacecat'

class App < Sinatra::Application

  get '/' do
    @spacecats = SpaceCat.all
  end

end
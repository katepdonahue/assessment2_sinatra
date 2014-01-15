require 'bundler'
Bundler.require

class App < Sinatra::Application

  get '/' do
    @spacecats = SpaceCat.all
  end

end
require 'sinatra/base'
require './lib/manager'

class BookmarkManager < Sinatra::Base
  get "/" do
    p ENV
    @bookmarks = Manager.all
    erb(:index)
  end

  post "/new" do
    Manager.add(params[:new_bookmark])
    redirect "/"
  end

  run! if app_file == $0
end

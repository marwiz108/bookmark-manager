require 'sinatra/base'
require './lib/manager'

class BookmarkManager < Sinatra::Base
  get "/" do
    p ENV
    @bookmarks = Manager.all
    erb(:index)
  end

  run! if app_file == $0
end

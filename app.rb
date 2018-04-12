require 'sinatra/base'
require 'sinatra/flash'
require './lib/manager'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get "/bookmarks" do
    p ENV
    @bookmarks = Manager.all
    erb(:index)
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks/new" do
    Manager.all
    Manager.add(params[:new_bookmark])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end

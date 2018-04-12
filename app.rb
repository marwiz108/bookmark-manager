require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/manager'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get "/bookmarks" do
    @bookmarks = Manager.all
    erb(:index)
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks/newurl" do
    Manager.all
    if params[:new_bookmark] =~ URI::regexp
      Manager.add(params[:new_bookmark])
    else
      flash[:error] = "Invalid url."
      redirect "/bookmarks/new"
    end
    redirect "/bookmarks"
  end

  run! if app_file == $0
end

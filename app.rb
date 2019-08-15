require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  # get '/' do
  #   "Hello World"
  # end

  get '/' do
    'Book Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/bookmarks/new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end


  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'/bookmarks/update'
  end

  patch '/bookmarks/:id' do
      Bookmark.update(url: params[:url], title: params[:title])
      redirect '/bookmarks'
  end


  run! if app_file == $0
end

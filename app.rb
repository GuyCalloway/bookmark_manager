require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  # get '/' do
  #   "Hello World"
  # end

  get '/' do
    'Book Manager'
  end

  get '/bookmarks' do

    @bookmarks = Bookmark.all
    p "BOOKMARKS"
    p @bookmarks
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/bookmarks/new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end


  run! if app_file == $0
end

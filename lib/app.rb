# frozen_string_literal: true

require 'sinatra/base'
require_relative './bookmark_manager'

# this is the BookmarkManager class
class WebBookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'eleven'

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = BookmarkManager.show_bookmarks
    erb :bookmarks
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/add_bookmarks' do
    BookmarkManager.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    BookmarkManager.delete(params.key("Delete"))
    redirect '/bookmarks'
  end
end

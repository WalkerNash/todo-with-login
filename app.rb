require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models'

enable :sessions
# Database configuration
set :database, "sqlite3:development.sqlite3"

# helper methods
def current_user
  @user ||= User.find_by_id(session[:user_id])
end

def authenticate_user
  redirect '/' if current_user.nil?
end

# Define routes below
get '/' do
  if current_user
    redirect '/todo'
  else
    erb :index
  end
end

get '/todo' do
  authenticate_user
    erb :todo
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/todo/new' do
  authenticate_user
  erb :'lists/new'

end

get '/todo/:id' do
  authenticate_user
  @list = List.find_by_id(params[:id])
  erb :'lists/show'
end

post '/login' do
  username = params[:username].downcase
  user = User.find_or_create_by(username: username)
  session[:user_id] = user.id
  redirect "/todo"
end

post '/todo' do
  authenticate_user
  @user.lists.create(title: params[:title])
  redirect '/todo'
end





#

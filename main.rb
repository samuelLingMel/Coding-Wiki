require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?
require 'bcrypt'

require_relative 'models/articles'
require_relative 'models/users'

enable(:sessions)

get '/' do
    erb(:index)
end

get '/article/create' do
    if logged_in?()
        erb(:add_article)
    else 
        erb(:user_login, locals: { error: 'please make an account to create articles'})
    end
end

get '/article/:id/edit' do
    article = find_one_article_by_id( params[:id] )
    user = find_one_user_by_id(article["user_id"])
    erb(:update_article, locals: { article: article, user: user })
end

get '/article/:id/delete' do
    article = find_one_article_by_id( params[:id] )
    erb(:delete_article, locals: { article: article })
end  
    
get '/article/:id' do
    article = find_one_article_by_id( params[:id])
    user = find_one_user_by_id(article["user_id"])
    erb(:read_article, locals: { article: article, user: user})
end

post '/article' do
    create_article(params[:title], params[:body], params[:diagram_url], params[:user_id])
    article = find_one_article_by_user_id_and_title( params[:user_id], params[:title])
    redirect("/article/#{ article["id"]}")
end

patch '/article' do
    edit_article(params[:id], params[:title], params[:body], params[:diagram_url] )
    redirect("/article/#{ params[:id] }")
end

delete '/article' do
    delete_article(params[:id])
    redirect('/')
end

get '/user/:id/edit' do
    user = find_one_user_by_id(params[:id])
    article = find_one_article_by_id( user["id"] )
    erb(:update_article, locals: { article: article, user: user })
end

get '/user/signup' do
    erb(:create_user)
end

get '/user/login' do
    erb(:user_login, locals: { error: ""})
end


get '/user/logout' do
    session[:user_id] = nil
    session[:username] = nil
    redirect '/user/login'
end

get '/user/:id' do
    user = find_one_user_by_id(params[:id])
    articles = find_all_articles_by_user_id(user["user_id"])
    erb(:show_user, locals: {user: user, articles2: articles})
end



post '/user/login' do
    user = find_one_user_by_email( params[:email] )

    if user && BCrypt::Password.new(user["password_digest"]) == params[:password] 
        session[:user_id] = user['user_id']
        session[:username] = user['username']
        redirect '/'
    else 
        erb(:user_login, locals: {error: "your email or password is incorrect"})
    end
end

post '/user' do
    create_user(params[:email], params[:password], params[:username])
    redirect '/user/login'
end

patch '/user' do
    update_user(params[:email], params[:password], params[:username])
    redirect '/user/login'
end

delete '/user' do
    delete_user(params[:id])
    delete_all_articles_by_user_id(params[:id])
    redirect '/'
end




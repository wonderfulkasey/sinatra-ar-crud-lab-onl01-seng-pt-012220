
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do 
      erb :new
    end
  
    post '/articles' do  
      @article = Article.create(params)
      redirect to '/articles'
    end 
  
    get '/articles' do 
      @articles = Article.all
      erb :index
    end
  
    get '/articles/:id' do  
      @article = Article.find_by_id(params[:id])
      erb :show
    end
  
    get '/articles/:id/edit' do 
      @article = Article.find_by_id(params[:id])
      erb :edit
    end
  
    patch '/articles/:id' do  
      @article = Article.find_by_id(params[:id])
      @article.name = params[:name]
      @article.content = params[:content]
      @article.save
      erb :show
    end
  
  
    delete '/articles/:id/delete' do 
      @article = Article.find_by_id(params[:id])
      @articles.delete
      redirect to '/articles'
    end
  
end

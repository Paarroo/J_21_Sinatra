require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    author = params[:author_name]
    content = params[:gossip_content]
    Gossip.new(author, content).save
    redirect '/'
  end
  get '/gossips/read/' do
    erb :read_gossip, locals: { gossips: Gossip.all }
  end
  get '/gossips/:id' do
    @gossip = Gossip.find(params['id'])

    @gossip ? erb(:show) : "There is nothing to see here .."
  end
end

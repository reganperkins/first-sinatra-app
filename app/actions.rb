# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  @message = Message.new(
    title:   params[:title],
    content: params[:content],
    author:  params[:author]
  )
  if @message.title.nil? || @message.author.nil? || @message.content.nil?
    erb :'messages/new'
  else
    @message.save
    redirect '/messages'
  end
  # if @message
  #   @message.save
  #   redirect '/messages'
  # else
  #   erb :'messages/new'
  # end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
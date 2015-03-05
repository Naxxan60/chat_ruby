require 'sinatra'
require 'mongo'
include Mongo

get '/' do
  	@title = 'Chat en ruby'
	erb :IndexView
end

get '/GetMessages' do
  	@title = 'Get All Messages'
	mongo_client = MongoClient.new("ds039341.mongolab.com", 39341)
	db = mongo_client.db("chat_ruby_db")
	auth = db.authenticate("user", "password")
	coll = db.collection("messages")
 	@messages = coll.find
	erb :GetMessagesView
end

get '/SendMessage'do
	erb :SendMessageView
end 

post '/SendMessage'do
	mongo_client = MongoClient.new("ds039341.mongolab.com", 39341)
	db = mongo_client.db("chat_ruby_db")
	auth = db.authenticate("user", "password")
	coll = db.collection("messages")

	autor = params[:autor]
	message = params[:message]

	doc ={"autor" => autor, "message" => message}
	coll.insert(doc)
	erb :MessageSentView
end 

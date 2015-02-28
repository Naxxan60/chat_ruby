require 'sinatra'
require 'mongo'
include Mongo

get '/GetMessages' do
  	@title = 'Get All Messages'
	mongo_client = MongoClient.new("ds039341.mongolab.com", 39341)
	db = mongo_client.db("chat_ruby_db")
	auth = db.authenticate("user", "password")
	coll = db.collection("messages")
 	@messages = coll.find
	erb :GetMessagesView
end

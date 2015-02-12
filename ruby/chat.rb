require 'sinatra'
require 'mongo'
include Mongo

get '/GetMessages' do
  	"Hello World!"
	mongo_client = MongoClient.new("ds039341.mongolab.com", 39341)
	db = mongo_client.db("chat_ruby_db")
	coll = db.collection("messages")
end

require 'sinatra'
require 'open-uri'
require 'rexml/document'

get '/' do
	erb :index
end

get '/api' do
	erb :api
end

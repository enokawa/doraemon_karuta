require 'sinatra'
require 'open-uri'
require 'rexml/document'

get '/' do
	@question_text = question_text
	@answer_text = answer_text.to_s.split('　')
	erb :index
end

get '/api' do
	erb :api
end

def api_response
	key = ENV["ASAHI_KENSAKU_API"]
	REXML::Document.new(open("http://54.92.123.84/search?q=Title:%E3%83%89%E3%83%A9%E3%81%88%E3%82%82%E3%82%93%20AND%20ReleaseDate:2010-01-10&ackey=#{key}"))
end

def question_text
	doc = api_response
	question = doc.elements['response/result/doc/Body']
end

def answer_text
	doc = api_response
	answer = doc.elements['response/result/doc[2]/Body']
end

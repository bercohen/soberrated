class StaticController < ApplicationController
	
	def index
	   require 'net/http'
	   source = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:i]}"
	   resp = Net::HTTP.get_response(URI.parse(source))
	   data = resp.body
	   p resp
	   p data
	   @result = JSON.parse(data)
	end
	def show
		source = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:id]}"
	   resp = Net::HTTP.get_response(URI.parse(source))
	   data = resp.body
	   p resp
	   p data
	   @result = JSON.parse(data)
	end
end

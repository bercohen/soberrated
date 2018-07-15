require 'net/http'

class StaticController < ApplicationController

	def mix
		p params
		data = []
		@ingredients = params[:i] || []
		if params[:i]
			params[:i].each_with_index do |ingredient,index|
				source = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
				response = Net::HTTP.get_response(URI.parse(source))
				data.push( JSON.parse(response.body) )
				sleep(1) if index+1 < params[:i].length
			end

			@result = data.reduce([]) do |arr,d|
				if arr.empty?
					d['drinks']
				else
					arr & d['drinks']
				end
			end
		end




	end
	def show
		source = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:id]}"
	   resp = Net::HTTP.get_response(URI.parse(source))
	   data = resp.body
	   p resp
	   p data
	   @result = JSON.parse(data)
	end

	def choose
	    source = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:i]}"
	    resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end

	def random
		source = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
		resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end

	def search
		source = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:s]}"
		resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end
end

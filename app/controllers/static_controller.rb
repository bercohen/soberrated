require 'net/http'

class StaticController < ApplicationController
	
	def mix
		p params
		data = []
		@ingredients = params[:i] || []
		if params[:i]
			params[:i].each_with_index do |ingredient,index|
				source = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
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
	   # ingredient1 = params[:i]
	   # ingredient2 = params[:j]
	   # source1 = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient1}"
	   # source2 = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient2}"

	   # resp1 = Net::HTTP.get_response(URI.parse(source1))
	   # sleep(1)
	   # resp2 = Net::HTTP.get_response(URI.parse(source2))
	   # data1 = JSON.parse(resp1.body)
	   # data2 = JSON.parse(resp2.body)
	   # # p resp
	   # # p data
	   # p data1
	   # p data2

	   # @result = data1['drinks'] & data2['drinks']



	end
	def show
		source = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{params[:id]}"
	   resp = Net::HTTP.get_response(URI.parse(source))
	   data = resp.body
	   p resp
	   p data
	   @result = JSON.parse(data)
	end

	def choose
	    source = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:i]}"
	    resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end

	def random
		source = "http://www.thecocktaildb.com/api/json/v1/1/random.php"
		resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end

	def search
		source = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:s]}"
		resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    p resp
	    p data
	    @result = JSON.parse(data)
	end
end


class InstagramSessionController < ApplicationController

	protect_from_forgery :except => :results 


	def index

	end

	def create

		 auth1 = request.env["omniauth.auth"]

	    access_token = auth.credentials.token
	    name = auth.info.name
	    uid = auth.info.uid
	    nickname = auth.info.nickname

	    session[:access_token] = access_token
	    session[:name] = name
	    session[:uid] = uid
	    session[:nickname] = nickname

	    puts "The instagram access token is #{access_token}"


	    redirect_to search_path
	end

end

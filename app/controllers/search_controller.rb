class SearchController < ApplicationController

def search_params

end

def index

	token = session[:access_token]

	user_id = session[:uid]

	@client = Strava::Api::V3::Client.new(:access_token => token)

	@current_athlete = @client.retrieve_current_athlete

	@runs = @client.list_athlete_activities
	
	activity_id = params[:activity_id]



	headers = {"Content-type"=> "application/json", "Authorization"=> "Bearer d2e2f6ce8fbf2f0ade6adf4347ea791c0cf8bfcf"}

	p @coordinates = HTTParty.get("https://www.strava.com/api/v3/activities/257526140/streams/latlng", :headers => headers)

	debug




	# @last_run = HTTParty.get('https://www.strava.com/api/v3/activities/57526140/streams/latlng')


	

end

end

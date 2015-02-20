class SearchController < ApplicationController

def search_params

end

def index

	token = session[:access_token]

	@client = Strava::Api::V3::Client.new(:access_token => token)

	@activties =	@client.list_athlete_activities

	
end

end

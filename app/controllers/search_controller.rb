class SearchController < ApplicationController


def search_params

end

def index

	token = session[:strava_access_token]

	user_id = session[:uid]

	@client = Strava::Api::V3::Client.new(:access_token => token)

	@current_athlete = @client.retrieve_current_athlete

	@runs = @client.list_athlete_activities

end

def search_runs


	token = session[:strava_access_token]

	user_id = session[:uid]

	@client = Strava::Api::V3::Client.new(:access_token => token)

	
	activity_id = params[:activity_id]



  run_id = params[:run_id]

  p "this is the run id >>>>>>>> #{run_id}"


	url = "https://www.strava.com/api/v3/activities/#{run_id}/streams/latlng"



	headers = {"Content-type"=> "application/json", "Authorization"=> "Bearer d2e2f6ce8fbf2f0ade6adf4347ea791c0cf8bfcf"}

	@stream = HTTParty.get(url, :headers => headers)

	
	# @stream = HTTParty.get("https://www.strava.com/api/v3/activities/257526140/streams/latlng", :headers => headers)

	@coordinates = @stream.parsed_response[0]['data']

	@filtered_coordinates = every_tenth_coordinate(@coordinates)



	render json: @filtered_coordinates


	#i can't think of an easier way to make it easy for a user to look up previous runs other than displaying them all on the screen

	#then the user can click on the run depending on the date / title of the input run; ljll

	#when you click on the activity, it should get the coordinates and then enter those coordinates into instragram
end

	private
	def every_tenth_coordinate(coorindate_input)
		filtered = []
		coorindate_input.each_with_index do |coord, index|
			if index % 100 == 0	
			filtered << coord
			end
		end
		return filtered
	end

	
end

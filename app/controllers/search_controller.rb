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

	@stream = HTTParty.get("https://www.strava.com/api/v3/activities/257526140/streams/latlng", :headers => headers)


	@coordinates = @stream.parsed_response[0]['data']

	@filtered_coordinates = every_tenth_coordinate(@coordinates)



	debug	

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

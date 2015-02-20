
class SessionsController < ApplicationController



# def request_access

	# @code=params["code"];
	#      @response_temp=HTTParty.post("https://www.strava.com/oauth/token",:body=>{
	#     :client_id => '4820',
	#     :client_secret => '5a016a1216d550e6811e746f68fce90ff53851a9',
	#     :code=>@code,
	#     :redirect_uri=>"https://localhost:3000"
	#     }.to_json,
	#     :headers => {'Content-Type'=>'application/json'})
	#     p @response_temp
	#     access_token=@response_temp.parsed_response["access_token"]
	



	# url = "https://www.strava.com/oauth/authorize?client_id=4820&response_type=code&redirect_uri=http://localhost:3000&approval_prompt=force"

	# @response = HTTParty.post(url)

	# render json: @response
	
def create
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    auth = request.env["omniauth.auth"]

    access_token = auth.credentials.token
    name = auth.info.name
    uid = auth.info.uid
    nickname = auth.info.nickname

    session[:access_token] = access_token
    session[:name] = name
    session[:uid] = uid
    session[:nickname] = nickname

    puts "The access token is #{access_token}"

    redirect_to search_path

end



def token_exchange


end

# https://www.strava.com/oauth/authorize?client_id=4820&redirect_uri=http://localhost:3000&response_type=code


# access code:
# a7682c41f07ee5b455f522465c42f998d3badcf5
end

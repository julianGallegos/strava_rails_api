
class SessionsController < ApplicationController


	
def create

    auth = request.env["omniauth.auth"]

    access_token = auth.credentials.token
    name = auth.info.name
    uid = auth.uid
    

    session[:access_token] = access_token
    session[:name] = name
    p session[:uid] = uid
 
    puts "The access token is #{access_token}"

    redirect_to search_path

end



def token_exchange


end

# https://www.strava.com/oauth/authorize?client_id=4820&redirect_uri=http://localhost:3000&response_type=code


# access code:
# a7682c41f07ee5b455f522465c42f998d3badcf5
end

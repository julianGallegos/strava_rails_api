
class SessionsController < ApplicationController


	
def create

    auth_strava = request.env["omniauth.auth"]

    strava_access_token = auth_strava.credentials.token
    name = auth_strava.info.name
    uid = auth_strava.uid
    

    session[:strava_access_token] = strava_access_token
    session[:name] = name
    p session[:uid] = uid
 
    puts "The strava access token is #{:strava_access_token}"


    debug

end



def instagram_token



    auth_instagram = request.env["omniauth.auth"]

    access_token = auth_instagram.credentials.token
    name = auth_instagram.info.name
    uid = auth_instagram.info.uid
    nickname = auth_instagram.info.nickname

    session[:access_token] = access_token
    session[:name] = name
    session[:uid] = uid
    session[:nickname] = nickname

    puts "The access token is #{access_token}"

    debug

end

# https://www.strava.com/oauth/authorize?client_id=4820&redirect_uri=http://localhost:3000&response_type=code


# access code:
# a7682c41f07ee5b455f522465c42f998d3badcf5
end

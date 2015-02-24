
class SessionsController < ApplicationController


	
def create

    if request.env["omniauth.auth"].provider == "strava"
    auth_strava = request.env["omniauth.auth"]

    strava_access_token = auth_strava.credentials.token
    name = auth_strava.info.name
    uid = auth_strava.uid
    

    session[:strava_access_token] = strava_access_token
    session[:name] = name
    p session[:uid] = uid
 
    puts "The strava access token is #{:strava_access_token}"

    render "pages/instagram_sign_in"

    else request.env["omniauth.auth"].provider == "instagram"

    set_instagram_token

    end

    # if request.env["omniauth.auth"].provider == nil
    # #after all that's done redirect to instagram path

    # render "pages/instagram_sign_in"
    # #else if the path is instagram...redirect to instagram sign in page

    # else request.env["omniauth.auth"].provider == "instagram"
    # #first sign in with strava
    # set_instagram_token

    # end
    #create a 2nd login view for instagram login

    #if instagram session = session, take them to app search page

    #else instagram session = nil then take them to instragram login

    # put in instagram pages controller

end



def set_instagram_token

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

    redirect_to search_path

end

# https://www.strava.com/oauth/authorize?client_id=4820&redirect_uri=http://localhost:3000&response_type=code


# access code:
# a7682c41f07ee5b455f522465c42f998d3badcf5
end

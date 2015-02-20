Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, "4820",'5a016a1216d550e6811e746f68fce90ff53851a9'
end

# ENV['STRAVA_KEY'], ENV['STRAVA_SECRET']
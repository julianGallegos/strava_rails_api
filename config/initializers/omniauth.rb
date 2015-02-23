Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, "4820",'5a016a1216d550e6811e746f68fce90ff53851a9'
  provider :instagram, "dc02dfa8da374c0ea5e52ec0e40a3210", "02cd577346bd45c489fe0cad2e6c3c06"
end


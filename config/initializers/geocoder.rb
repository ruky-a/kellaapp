Geocoder.configure(
  lookup: :google,
  api_key: ENV['GEOCODER_API_KEY'],
   timeout: 15
)
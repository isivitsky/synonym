require 'json'
require 'net/http'
require 'uri'

begin
YaDictToken = '' # Get your own at https://tech.yandex.ru/keys/get/?service=dict
Locale = 'ru-ru'
URL = 'https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=' + YaDictToken + '&lang=' + Locale + '&text=' + ARGV[0]
encoded = URI.encode(URL)
uri = URI.parse(encoded)
response = Net::HTTP.get(uri)
p data = JSON.parse(response)['def'][0]['tr']
rescue StandardError
  puts "No synonyms found."
end
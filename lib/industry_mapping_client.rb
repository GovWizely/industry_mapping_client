require 'industry_mapping_client/version'
require 'httparty'

class IndustryMappingClient

  HOST     = 'im.govwizely.com'
  BASE_URL = "http://#{HOST}/api/industries.json"

  def self.map_industry(topic, source)
    results = HTTParty.get(BASE_URL, query: {topic: topic, source: source})
    results.count > 0 ? results[0]['name'] : nil
  end

end

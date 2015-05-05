require 'industry_mapping_client/version'
require 'industry_mapping_client/configurations'
require 'httparty'

class IndustryMappingClient
  def self.map_industry(topic, source)
    results = HTTParty.get(@config[:base_url], query: { topic: topic,
                                                        source: source,
                                                        log_failed: @config[:log_failed] })
    results && results.count > 0 ? results[0]['name'] : nil
  end
end

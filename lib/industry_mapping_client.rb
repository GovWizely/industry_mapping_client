require 'industry_mapping_client/version'
require 'industry_mapping_client/configurations'
require 'httparty'

class IndustryMappingClient
  def self.map_industry(mapped_term, source)
    response = HTTParty.get(@config[:base_url], query: { mapped_term: mapped_term,
                                                        source: source,
                                                        log_failed: @config[:log_failed] })
    results = JSON.parse(response.body)
    results && results.count > 0 ? results.map{ |r| r['name'] } : nil
  end
end

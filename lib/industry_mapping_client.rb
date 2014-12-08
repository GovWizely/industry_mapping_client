require 'industry_mapping_client/version'
require 'open-uri'
require 'json'

class IndustryMappingClient
  class << self
    attr_accessor :host

    def map_industry(search_term)
      payload(search_term)[:industry_name]
    rescue OpenURI::HTTPError => e
      nil
    end

    def payload(search_term)
      JSON.parse(open(url(search_term)).read, symbolize_names: true)
    end

    def url(search_term)
      "http://#{host}/industry_sector.json?emenu=#{CGI.escape(search_term)}"
    end
  end

  self.host = 'im.govwizely.com'
end

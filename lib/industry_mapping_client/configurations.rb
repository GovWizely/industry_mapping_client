class IndustryMappingClient
  @config = {
    log_failed: false,
    base_url:   'http://im.govwizely.com/api/industries.json'
  }

  @valid_config_keys = @config.keys

  def self.configure(options = {})
    options.each { |key, value| @config[key.to_sym] = value if @valid_config_keys.include? key.to_sym }
    @config[:log_failed] = false unless @config[:log_failed]
  end
end

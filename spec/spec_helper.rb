require 'industry_mapping_client'
require 'pry'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
  stub_request(:get, "http://im.govwizely.com/api/terms.json?log_failed=false&mapped_term=This%20will%20probably%20never%20ever%20ever%20be%20an%20industry.&source=MarketResearch").
           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => "[]", :headers => {})
  stub_request(:get, "http://im.govwizely.com/api/terms.json?log_failed=false&mapped_term=Agribusiness&source=MarketResearch").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => '[{"id":1, "name":"Agribusiness"}, {"id":2, "name":"Chemicals"}]', :headers => {})
  end
end

# IndustryMappingClient

API client for the GovWizely/ITA industry_mapping service.

## Code Status

* [![Build Status](https://travis-ci.org/GovWizely/industry_mapping_client.svg?branch=master)](https://travis-ci.org/GovWizely/industry_mapping_client/)

## Installation

Add this line to your application's Gemfile:

    gem 'industry_mapping_client', git: 'git@github.com:GovWizely/industry_mapping_client.git'

And then execute:

    $ bundle

## Usage

    IndustryMappingClient.map_industry('Agribusiness', 'MarketResearch')
    # returns ["Agribusiness", "Chemicals"]

## Configuration

You can configure how the gem behaves like so:

    IndustryMappingClient.configure(log_failed: false,
                                    base_url:   'http://localhost:3001/api/terms.json')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/industry_mapping_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

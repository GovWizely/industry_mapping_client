require 'spec_helper'

describe IndustryMappingClient do
  describe '.map_industry' do
    subject { described_class.map_industry(term) }
    context 'searching for "Construction Eq."' do
      let(:term) { 'Construction Eq.' }
      it { should eq 'Construction, Building & Heavy Equipment' }
    end

    context 'searching for non-existent eMenu' do
      let(:term) { 'This will probably never ever ever be an industry.' }
      it { should be_nil }
    end
  end

  describe '.url' do
    it 'escapes all in the search term' do
      expect(described_class.url('Construction & Equipment'))
        .to eq "http://#{described_class.host}/industry_sector.json?emenu=Construction+%26+Equipment"
    end
  end

  describe '.host' do
    let(:host) { 'example.com' }
    it 'can be changed' do
      described_class.host = host
      expect(described_class.host).to eq host
    end
  end
end

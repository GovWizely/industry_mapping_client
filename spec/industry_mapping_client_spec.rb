require 'spec_helper'

describe IndustryMappingClient do

  let(:source) { 'MarketResearch' }

  describe '.map_industry' do
    subject { described_class.map_industry(term, source) }
    context 'searching for "Construction Eq."' do
      let(:term) { 'Construction Eq.' }
      it { should eq 'Construction, Building & Heavy Equipment' }
    end

    context 'searching for non-existent eMenu' do
      let(:term) { 'This will probably never ever ever be an industry.' }
      it { should be_nil }
    end
  end

end

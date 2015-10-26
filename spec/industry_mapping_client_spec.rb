require 'spec_helper'

describe IndustryMappingClient do

  let(:source) { 'MarketResearch' }

  describe '.map_industry' do
    subject { described_class.map_industry(term, source) }
    context 'searching for "Agribusiness"' do
      let(:term) { 'Agribusiness' }
      it { should match_array ['Agribusiness', 'Chemicals'] }
    end

    context 'searching for non-existent term' do
      let(:term) { 'This will probably never ever ever be an industry.' }
      it { should be_nil }
    end
  end

  describe '.configure' do
    describe 'log_failed option' do
      subject { described_class.instance_variable_get('@config')[:log_failed] }
      let(:base_url) { 'example.com' }

      let(:mapped_term) { 'fake_mapped_term' }
      let(:source) { 'fake_source' }
      let(:query) do
        { query: { mapped_term: mapped_term,
                   source: source,
                   log_failed: log_failed } }
      end

      context 'by default' do
        it { is_expected.to be_falsey }
      end

      context 'when log_failed configured' do
        let(:log_failed) { true }

        before do
          IndustryMappingClient.configure(log_failed: log_failed)
          IndustryMappingClient.configure(base_url: base_url)
        end

        context 'when set to true' do
          it { is_expected.to be_truthy }
        end

        context 'when set to false' do
          let(:log_failed) { false }

          it { is_expected.to be_falsey }
        end

        context 'when set invalid value' do
          let(:log_failed) { nil }

          it { is_expected.to be_falsey }
        end
      end
    end
  end
end

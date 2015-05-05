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

  describe '.configure' do
    describe 'log_failed option' do
      subject { described_class.instance_variable_get('@config')[:log_failed] }
      let(:base_url) { 'example.com' }

      let(:topic) { 'fake_topic' }
      let(:source) { 'fake_source' }
      let(:query) do
        { query: { topic: topic,
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

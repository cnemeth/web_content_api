require 'rails_helper'

RSpec.describe FetchWebContent do
  let(:url) { 'https://github.com/cnemeth' }

  describe 'call' do
    context 'with valid url' do
      let(:web_content_fetcher) { FetchWebContent.new(url: url) }

      before { @response = web_content_fetcher.call }

      it 'response object' do
        expect(@response).to be_a_kind_of FetchWebContent::Result
      end

      it 'response code' do
        expect(@response.status_code).to eq 200
      end

      it 'response message' do
        expect(@response.status_message).to eq 'OK'
      end

      it 'headers' do
        expect(@response.headers).to be_a_kind_of Typhoeus::Response::Header
      end

      it 'response body' do
        expect(@response.body).to be_a_kind_of Nokogiri::HTML::Document
      end
    end

    context 'with invalid url' do
      let(:web_content_fetcher) { FetchWebContent.new(url: 'foo_bar') }

      before { @response = web_content_fetcher.call }

      it 'response object' do
        expect(@response).to be_a_kind_of FetchWebContent::Result
      end

      it 'response code' do
        expect(@response.status_code).to eq 0
      end

      it 'response message' do
        expect(@response.status_message).to be_nil
      end

      it 'headers' do
        expect(@response.headers).to eq({})
      end
    end
  end
end

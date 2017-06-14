require 'rails_helper'

RSpec.describe FetchWebContent do
  let(:url) { 'https://github.com/cnemeth' }

  describe 'call' do
    before { @response = FetchWebContent.new(url: url).call }

    it 'response code' do
      expect(@response.status_code).to eq 200
    end

    it 'response message' do
      expect(@response.status_message).to eq 'OK'
    end

    it 'response object' do
      expect(@response).to be_a_kind_of FetchWebContent::Result
    end

    it 'headers' do
      expect(@response.headers).to be_a_kind_of Typhoeus::Response::Header
    end

    it 'response body' do
      expect(@response.body).to be_a_kind_of Nokogiri::HTML::Document
    end
  end
end

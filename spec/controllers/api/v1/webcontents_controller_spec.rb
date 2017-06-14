require_relative '../../api/api_spec_helper'

RSpec.describe Api::V1::WebcontentsController, type: :request do
  describe "POST /api/v1/webcontents" do
    let(:params) {
      {
        webcontent: {
          url: 'https://github.com/cnemeth'
        }
      }
    }

    it 'creates a webcontent' do
      post '/api/v1/webcontents', params
      expect(last_response.status).to eq 201
    end

    it 'creates a new @webcontent' do
      expect{
        post 'api/v1/webcontents', params
      }.to change{Webcontent.count}.by(1)
    end

    it 'retrieves the webpage for the url' do
      skip
      post 'api/v1/webcontents', params
      expect(Webcontent.last.content).to_not be_empty
    end
  end
end

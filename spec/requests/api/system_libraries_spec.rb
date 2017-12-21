require 'rails_helper'

RSpec.describe Api::SystemLibrariesController, type: :request do
  let!(:system_libraries) { create_list(:system_library, 5) }

  describe 'GET /system_libraries' do
    before { get '/system_libraries' }

    it 'returns all system_libraries in the directory' do
      expect(json).to_not be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200 ok' do
      expect(response).to have_http_status(200)
    end
  end
end

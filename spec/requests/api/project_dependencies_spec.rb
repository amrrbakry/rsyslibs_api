require 'rails_helper'

RSpec.describe Api::ProjectDependenciesController, type: :request do
  let!(:project_dependencies) { create_list(:project_dependency, 5) }

  describe 'GET /project_dependencies' do
    before { get '/project_dependencies' }

    it 'returns all project dependencies in the directory' do
      expect(json).to_not be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200 ok' do
      expect(response).to have_http_status(200)
    end
  end
end

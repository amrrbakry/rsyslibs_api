require 'rails_helper'

RSpec.describe Api::LookupsController, type: :request do
  let(:gem) { create(:project_dependency) }
  let(:system_library) { create(:system_library, os: 'darwin16') }
  let(:system_library_windows) { create(:system_library, os: 'windows') }
  let!(:dependency_syslib) { create(:dependency_system_library, project_dependency: gem, system_library: system_library) }
  let!(:dependency_syslib_windows) { create(:dependency_system_library, project_dependency: gem, system_library: system_library_windows) }

  describe 'POST /lookup_syslibs' do
    let(:params) do
      {
        project_dependencies: [gem.name],
        os_info: {
          os: 'darwin16'
        }
      }
    end
    before { post '/lookup_syslibs', params: params }

    it 'should return all system libraries for the provided project dependency' do
      expect(json).to_not be_empty
      expect(json.size).to eq(1)
      expect(json[0]['name']).to eq(system_library.name)
    end

    it 'should return the correct system library (darwin16)' do
      expect(json[0]['os']).to eq('darwin16')
    end

    it 'returns status code 200 OK' do
      expect(response).to have_http_status(200)
    end
  end
end

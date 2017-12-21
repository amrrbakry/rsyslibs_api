require 'rails_helper'

RSpec.describe Api::ContributionsController, type: :request do
  describe 'POST /add_syslibs' do
    context 'when the dependency is not in the directory' do
      let(:valid_params) do
        {
          name: 'new_dep',
          version: '0.1.1',
          system_libraries: [
            {
              name: 'new_syslib',
              version: '0.1.1',
              os: 'darwin16'
            }
          ]
        }
      end
      before { post '/add_syslibs', params: valid_params }

      it 'creates a new dependency' do
        expect(json['name']).to eq('new_dep')
      end

      it 'creates system libraries for the dependency' do
        expect(json['system_libraries'][0]['name']).to eq('new_syslib')
      end

      it 'returns status code 201 created' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the dependency already exists' do
      let!(:dep) { create(:project_dependency, name: 'dep') }
      let(:valid_params) do
        {
          name: 'dep',
          system_libraries: [
            {
              name: 'new_syslib',
              version: '0.1.1',
              os: 'darwin16'
            }
          ]
        }
      end
      before { post '/add_syslibs', params: valid_params }

      it 'does not create dependency again' do
        expect(ProjectDependency.where(name: 'dep').size).to eq(1)
      end

      it 'associated the system library with the dependency' do
        expect(json['system_libraries'][0]['name']).to eq('new_syslib')
      end

      it 'returns status code 201 created' do
        expect(response).to have_http_status(201)
      end
    end
  end
end

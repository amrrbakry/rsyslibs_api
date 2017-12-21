module Api
  class LookupsController < ApplicationController
    before_action :set_project_dependencies, only: :index
    before_action :set_os_info, only: :index

    def index
      syslibs = []
      @project_dependencies.each do |dep|
        next if dep.system_libraries.empty?
        dep.system_libraries.where(@os_info).each do |syslib|
          syslibs << syslib unless syslibs.include?(syslib)
        end
      end

      render json: syslibs, status: 200, each_serializer: SystemLibrarySerializer
    end

    private

    def set_project_dependencies
      return render json: { error: 'Missing required param project_dependencies' }, status: 400 unless params[:project_dependencies]

      return render json: { error: 'project_dependencies should be an array of dependencies' }, status: 400 unless params[:project_dependencies].is_a?(Array)

      project_dependencies = params[:project_dependencies].map(&:downcase)
      @project_dependencies = ProjectDependency.where(name: project_dependencies)
    end

    def set_os_info
      return render json: { error: 'Missing required param os_info' }, status: 400 unless params[:os_info]

      return render json: { error: 'Missing required param os in os_info' }, status: 400 unless params[:os_info][:os]

      @os_info = params.require(:os_info).permit(%i[os os_bits os_vendor]).to_h
    end
  end
end

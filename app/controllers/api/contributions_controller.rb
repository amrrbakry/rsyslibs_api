module Api
  class ContributionsController < ApplicationController
    before_action :set_project_dependency, only: :create
    before_action :set_system_libraries, only: :create

    def create
      @syslibs.each do |syslib|
        dep_sys_lib = DependenciesSystemLibrary.where(project_dependency_id: @project_dependency.id, system_library_id: syslib.id).first_or_create
        next if dep_sys_lib
        DependenciesSystemLibrary.create(project_dependency_id: @project_dependency.id, system_library_id: syslib.id)
      end
      render json: @project_dependency, status: 201, serializer: ProjectDependencySerializer
    end

    private

    def set_project_dependency
      return render json: { error: 'Missing required param name' }, status: 400 unless permitted_params[:name]

      permitted_params[:name] = permitted_params[:name].downcase!
      @project_dependency = ProjectDependency.where(name: permitted_params[:name]).first_or_initialize(permitted_params.except(:system_libraries))

      return render json: @project_dependency.errors, status: 422 if @project_dependency.new_record? && !@project_dependency.save
    end

    def set_system_libraries
      return render json: { error: 'Missing required param system_libraries' }, status: 400 unless permitted_params[:system_libraries]

      @syslibs = []
      permitted_params[:system_libraries].each do |syslib|
        syslib['name'] = syslib['name'].downcase
        syslib['os'] = syslib['os'].downcase
        slib = SystemLibrary.where(name: syslib['name'], os: syslib['os']).first_or_initialize(syslib)
        return render json: slib.errors, status: 422 if slib.new_record? && !slib.save

        @syslibs << slib
      end
    end

    def permitted_params
      params.permit(:name, :version, :github_url, :website, :owner_name, system_libraries: %i[name version os os_bits os_vendor])
    end
  end
end

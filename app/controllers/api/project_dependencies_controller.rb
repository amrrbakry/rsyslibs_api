module Api
  class ProjectDependenciesController < ApplicationController
    def index
      @project_dependencies = ProjectDependency.all
      render json: @project_dependencies, status: 200, each_serializer: ProjectDependencySerializer
    end
  end
end

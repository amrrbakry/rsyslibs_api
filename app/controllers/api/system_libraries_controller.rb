module Api
  class SystemLibrariesController < ApplicationController
    def index
      @system_libraries = SystemLibrary.all
      render json: @system_libraries, status: 200, each_serializer: SystemLibrarySerializer
    end
  end
end

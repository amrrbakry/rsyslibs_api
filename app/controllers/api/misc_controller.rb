module Api
  class MiscController < ApplicationController
    def status
      render json: { status: 'OK' }, status: 200
    end
  end
end

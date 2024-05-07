class ApplicationController < ActionController::Base
  def render_errors(obj)
    render json: { errors: obj.errors }, status: 422
  end
end

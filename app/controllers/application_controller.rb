class ApplicationController < ActionController::Base
  before_action  :authenticate_user!, :set_allow_origin
  skip_before_action :verify_authenticity_token, only: [:options]


  def authenticate_user!
    if request.path_parameters[:format] != 'json'
      if cookies[:alunos_comunidade].blank?
        redirect_to "/login"
      end
    end
  end

  def options
    cross_domain
    render json: {}, status: 200
  end

  private

  def set_allow_origin
    if request.path_parameters[:format] == 'json'
      cross_domain #if validate_token
    end
  end

  def cross_domain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, OPTIONS, HEAD, DELETE'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Accept,Origin,Content-Type,X-LS-CORS-Template,X-LS-Auth-Token,X-LS-Auth-User-Token,Content-Type,X-LS-Sync-Result,X-LS-Sequence,token,authorization'
  end
end

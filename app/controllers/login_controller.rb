class LoginController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:login, :logar, :deslogar]
  layout 'login'

  def index
    redirect_to "/" if cookies[:alunos_comunidade].present?
  end

  def logar
    user = Administrador.where(email: params["email"], senha: params["senha"])
    if user.present?
      time = params["login"]["lembrar"] == "on" ? 1.year.from_now : 30.minutes.from_now
      user = user.first
      value = { id: user.id, nome: user.nome, email: user.email }
      cookies[:alunos_comunidade] = { value: value.to_json, expires: time, httponly: true }

      redirect_to root_path 
      return     
    end

    flash[:erro] = "Email ou senha inválidos"
    redirect_to login_path
  end

  def deslogar
    cookies[:alunos_comunidade] = nil
    redirect_to login_path
  end
end

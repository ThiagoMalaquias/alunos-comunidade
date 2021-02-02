class HomeController < ApplicationController
  def index
    @alunos = Aluno.all.order("name asc")
    @total_alunos = Aluno.count
    @alunos_ativos = Aluno.where(status: "approved").count
    @alunos_cancelados = Aluno.where(status: "canceled").count
  end

  def elements; end

end

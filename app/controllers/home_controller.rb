class HomeController < ApplicationController
  def index
    @alunos = Aluno.all.order("name asc").where(status: "approved")

    @total_alunos = Aluno.count
    @alunos_ativos = Aluno.where(status: "approved").count
    @alunos_cancelados = Aluno.where(status: "canceled").count

    hoje = Time.zone.now
    dia = hoje.day.to_s.rjust(2, "0")

    @alunos_vencimento = Aluno.where(status: "approved", vencimento: dia).count
  end

  def vencimentos
    hoje = Time.zone.now

    ontem = hoje - 1.day
    dia = ontem.day.to_s.rjust(2, "0")
    @alunos_vencimento_ontem = Aluno.all.order("name asc").where(status: "approved", vencimento: dia)

    dia = hoje.day.to_s.rjust(2, "0")
    @alunos_vencimento_hoje = Aluno.all.order("name asc").where(status: "approved", vencimento: dia)

    amanha = hoje + 1.day
    dia = amanha.day.to_s.rjust(2, "0")
    @alunos_vencimento_amanha = Aluno.all.order("name asc").where(status: "approved", vencimento: dia)
  end

end

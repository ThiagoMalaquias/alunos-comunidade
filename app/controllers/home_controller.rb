class HomeController < ApplicationController
  def index
    @alunos = Aluno.all
    @alunos_ativos         =  @alunos.order("name asc").where(status: "Ativo")
    @qtd_total_alunos      =  @alunos.count
    @qtd_alunos_ativos     =  @alunos.where(status: "Ativo").count
    @qtd_alunos_cancelados =  @alunos.where.not(status: "Ativo").count
    @qtd_alunos_sem_descricao = @alunos.where(status: "Ativo", description: nil).count
  end

  def vencimentos
    @alunos = Aluno.all.order("name asc").where(status: "approved")
    hoje = Time.zone.now

    ontem = hoje - 1.day
    dia = ontem.day.to_s.rjust(2, "0")
    @alunos_vencimento_ontem = @alunos.where(vencimento: dia)

    dia = hoje.day.to_s.rjust(2, "0")
    @alunos_vencimento_hoje = @alunos.where(vencimento: dia)

    amanha = hoje + 1.day
    dia = amanha.day.to_s.rjust(2, "0")
    @alunos_vencimento_amanha = @alunos.where(vencimento: dia)
  end

  def atrasados
    @alunos = Aluno.all.order("name asc").where(status: "delayed")
  end
end

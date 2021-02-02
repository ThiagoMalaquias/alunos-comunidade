class HomeController < ApplicationController
  def index
    @alunos = Aluno.all.order("name asc")
  end

  def elements; end

end

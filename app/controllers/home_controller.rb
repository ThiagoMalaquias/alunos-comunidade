class HomeController < ApplicationController
  def index
    @alunos = Aluno.all.order("name asc")
  end

  def elements; end
  def generic; end
end

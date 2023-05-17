class CursosController < ApplicationController
  def index
    @cursos = Curso.order("titulo asc")
  end

  def edit
  end

  private

  def set_aluno
    @curso = Curso.find(params[:id])
  end
end

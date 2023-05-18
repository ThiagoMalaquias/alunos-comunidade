class CursosController < ApplicationController
  before_action :set_curso, only: [:edit, :update]

  def index
    @cursos = Curso.order("titulo asc")
  end

  def edit
  end
  
  def update
    categorias = curso_params.delete(:categorias)
    respond_to do |format|
      if @curso.update(curso_params.merge(categorias: categorias.split(' ')))
        format.html { redirect_to cursos_url, notice: 'Curso atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end

  def curso_params
    params.fetch(:curso, {}).permit(:titulo, :codeNome, :descricao, :videoIntro, :professor, :capa, :link, :tipo, :preco, :categorias, :valor_de, :parcela, :desconto, :horas)
  end
end

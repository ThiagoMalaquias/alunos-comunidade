class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :importar]

  def index
    @alunos = Aluno.order("name asc")
  end

  def show
  end

  def importar
    if params[:arquivo].blank?
      flash[:error] = 'Selecione um arquivo .csv'
      redirect_to alunos_path
      return
    end

    unless File.basename(params[:arquivo].tempfile).include?('.csv')
      flash[:error] = 'Formato de arquivo não suportado. Selecione um arquivo com a extensão .csv'
      redirect_to alunos_path
      return
    end

    AlunoCsvService.new.call(params[:arquivo])
    flash[:sucesso] = 'Alunos importados com Sucesso'
    redirect_to alunos_path
  rescue StandardError => e
    flash[:error] = e
    redirect_to alunos_path
    nil
  end

  def new
    @aluno = Aluno.new
  end

  def edit
  end

  def create
    if request.path_parameters[:format] == 'json'
      @aluno = Aluno.params_aluno(params)
    else
      @aluno = Aluno.new(aluno_params)
    end
    
    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno criado com sucesso.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to alunos_url, notice: 'Aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Aluno excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    def aluno_params
      params.fetch(:aluno, {}).permit(:callback_type, :hottok, :aff, :aff_name, :currency, :xcode, :payment_type, :status, :prod, :prod_name, :producer_name, :purchase_date, :confirmation_purchase_date, :original_offer_price, :cms_marketplace, :cms_vendor, :price, :full_price, :name_subscription_plan, :email, :name, :first_name, :last_name, :phone_checkout_local_code, :phone_checkout_number,:vencimento)
    end
end

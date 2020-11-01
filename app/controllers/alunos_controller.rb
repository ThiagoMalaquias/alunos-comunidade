class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.all
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Aluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aluno_params
      params.require(:aluno).permit(:callback_type, :hottok, :aff, :aff_name, :currency, :xcode, :payment_type, :payment_engine, :status, :prod, :prod_name, :producer_name, :purchase_date, :confirmation_purchase_date, :original_offer_price, :cms_marketplace, :cms_vendor, :price, :full_price, :name_subscription_plan, :email, :name, :first_name, :last_name, :phone_checkout_local_code, :phone_checkout_number)
    end
end

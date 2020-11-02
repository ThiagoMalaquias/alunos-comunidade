class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

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
    if request.path_parameters[:format] == 'json'
      @aluno = Aluno.new
      @aluno.callback_type = params[:callback_type]
      @aluno.hottok = params[:hottok]
      @aluno.aff = params[:aff]
      @aluno.aff_name = params[:aff_name]
      @aluno.currency = params[:currency]
      @aluno.xcode = params[:xcode]
      @aluno.payment_type = params[:payment_type]
      @aluno.status = params[:status]
      @aluno.prod = params[:prod]
      @aluno.prod_name = params[:prod_name]
      @aluno.producer_name = params[:producer_name]
      @aluno.purchase_date = params[:purchase_date]
      @aluno.original_offer_price = params[:original_offer_price]
      @aluno.confirmation_purchase_date = params[:confirmation_purchase_date]
      @aluno.cms_marketplace = params[:cms_marketplace]
      @aluno.cms_vendor = params[:cms_vendor]
      @aluno.price = params[:price]
      @aluno.full_price = params[:full_price]
      @aluno.name_subscription_plan = params[:name_subscription_plan]
      @aluno.email = params[:email]
      @aluno.name = params[:name]
      @aluno.first_name = params[:first_name]
      @aluno.last_name = params[:last_name]
      @aluno.phone_checkout_local_code = params[:phone_checkout_local_code]
      @aluno.phone_checkout_number = params[:phone_checkout_number]
    else
      @aluno = Aluno.new(aluno_params)
    end
    
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
      params.fetch(:aluno, {}).permit(:callback_type, :hottok, :aff, :aff_name, :currency, :xcode, :payment_type, :status, :prod, :prod_name, :producer_name, :purchase_date, :confirmation_purchase_date, :original_offer_price, :cms_marketplace, :cms_vendor, :price, :full_price, :name_subscription_plan, :email, :name, :first_name, :last_name, :phone_checkout_local_code, :phone_checkout_number)
    end
end

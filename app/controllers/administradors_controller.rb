class AdministradorsController < ApplicationController
  before_action :set_administrador, only: [:show, :edit, :update, :destroy]

  def index
    @administradors = Administrador.all
  end

  def show
  end

  def new
    @administrador = Administrador.new
  end

  def edit
  end

  def create
    @administrador = Administrador.new(administrador_params)

    respond_to do |format|
      if @administrador.save
        format.html { redirect_to administradors_url, notice: 'Administrador was successfully created.' }
        format.json { render :show, status: :created, location: @administrador }
      else
        format.html { render :new }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @administrador.update(administrador_params)
        format.html { redirect_to administradors_url, notice: 'Administrador was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrador }
      else
        format.html { render :edit }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @administrador.destroy
    respond_to do |format|
      format.html { redirect_to administradors_url, notice: 'Administrador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_administrador
      @administrador = Administrador.find(params[:id])
    end

    def administrador_params
      params.require(:administrador).permit(:nome, :email, :senha)
    end
end

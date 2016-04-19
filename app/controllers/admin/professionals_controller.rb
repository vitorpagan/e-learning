class Admin::ProfessionalsController < Admin::ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]

  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = Professional.all
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals
  # POST /professionals.json
  def create
    @professional = Professional.new(professional_params)

    if @professional.save
      redirect_to admin_professionals_url, notice: 'Profissional criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /professionals/1
  # PATCH/PUT /professionals/1.json
  def update
    if @professional.update(professional_params)
      redirect_to admin_professionals_url, notice: 'Profissional atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /professionals/1
  # DELETE /professionals/1.json
  def destroy
    @professional.destroy
    redirect_to admin_professionals_url, notice: 'Profissional apagado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:name, :thumbnail, :description)
    end
end

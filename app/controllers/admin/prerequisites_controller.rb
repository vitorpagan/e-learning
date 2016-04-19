class Admin::PrerequisitesController < Admin::ApplicationController
  before_action :set_prerequisite, only: [:show, :edit, :update, :destroy]

  # GET /prerequisites
  # GET /prerequisites.json
  def index
    @prerequisites = Prerequisite.all
  end

  # GET /prerequisites/1
  # GET /prerequisites/1.json
  def show
  end

  # GET /prerequisites/new
  def new
    @prerequisite = Prerequisite.new
  end

  # GET /prerequisites/1/edit
  def edit
  end

  # POST /prerequisites
  # POST /prerequisites.json
  def create
    @prerequisite = Prerequisite.new(prerequisite_params)

    if @prerequisite.save
      redirect_to admin_prerequisites_url, notice: 'Pré-requisito criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /prerequisites/1
  # PATCH/PUT /prerequisites/1.json
  def update
    if @prerequisite.update(prerequisite_params)
      redirect_to admin_prerequisites_url, notice: 'Pré-requisito atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /prerequisites/1
  # DELETE /prerequisites/1.json
  def destroy
    @prerequisite.destroy
    redirect_to admin_prerequisites_url, notice: 'Pré-requisito apagado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prerequisite
      @prerequisite = Prerequisite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prerequisite_params
      params.require(:prerequisite).permit(:name)
    end
end

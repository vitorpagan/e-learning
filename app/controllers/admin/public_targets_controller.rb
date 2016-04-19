class Admin::PublicTargetsController < Admin::ApplicationController
  before_action :set_public_target, only: [:show, :edit, :update, :destroy]

  # GET /public_targets
  # GET /public_targets.json
  def index
    @public_targets = PublicTarget.all
  end

  # GET /public_targets/1
  # GET /public_targets/1.json
  def show
  end

  # GET /public_targets/new
  def new
    @public_target = PublicTarget.new
  end

  # GET /public_targets/1/edit
  def edit
  end

  # POST /public_targets
  # POST /public_targets.json
  def create
    @public_target = PublicTarget.new(public_target_params)

    if @public_target.save
      redirect_to admin_public_targets_url, notice: 'Público alvo criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /public_targets/1
  # PATCH/PUT /public_targets/1.json
  def update
    if @public_target.update(public_target_params)
      redirect_to admin_public_targets_url, notice: 'Público alvo atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /public_targets/1
  # DELETE /public_targets/1.json
  def destroy
    @public_target.destroy
    redirect_to admin_public_targets_url, notice: 'Público alvo apagado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_target
      @public_target = PublicTarget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_target_params
      params.require(:public_target).permit(:name)
    end
end

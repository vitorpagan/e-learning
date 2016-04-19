class Admin::VideoClassesController < Admin::ApplicationController
  before_action :set_video_class, only: [:show, :edit, :update, :destroy]

  # GET /video_classes
  # GET /video_classes.json
  def index
    @video_classes = VideoClass.all
  end

  # GET /video_classes/1
  # GET /video_classes/1.json
  def show
  end

  # GET /video_classes/new
  def new
    @video_class = VideoClass.new
  end

  # GET /video_classes/1/edit
  def edit
  end

  # POST /video_classes
  # POST /video_classes.json
  def create
    @video_class = VideoClass.new(video_class_params)
    @video_class.courses = Course.where(id: params[:video_class][:courses_ids])
    @video_class.public_targets = PublicTarget.where(id: params[:video_class][:public_targets_ids])
    @video_class.prerequisites = Prerequisite.where(id: params[:video_class][:prerequisites_ids])

    if @video_class.save
      redirect_to admin_video_classes_url, notice: 'Aula foi criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /video_classes/1
  # PATCH/PUT /video_classes/1.json
  def update
    @video_class.courses = Course.where(id: params[:video_class][:courses_ids])
    @video_class.public_targets = PublicTarget.where(id: params[:video_class][:public_targets_ids])
    @video_class.prerequisites = Prerequisite.where(id: params[:video_class][:prerequisites_ids])

    if @video_class.update(video_class_params)
      redirect_to admin_video_classes_url, notice: 'Aula foi atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /video_classes/1
  # DELETE /video_classes/1.json
  def destroy
    @video_class.destroy
    redirect_to admin_video_classes_url, notice: 'Aula foi apagada com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_class
      @video_class = VideoClass.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_class_params
      params.require(:video_class).permit(
        :title, :description, :duration, :price,
        :professional_id, :embed_ios, :embed_android,
        :embed, :thumbnail, :handout, :free
      )
    end
end

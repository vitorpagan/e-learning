class Admin::CoursesController < Admin::ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.order(id: :asc)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @categories = Category.where(parent_id: nil)
  end

  # GET /courses/1/edit
  def edit
    @categories = Category.where(parent_id: nil)
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @categories = Category.where(parent_id: nil)

    if @course.save
      redirect_to admin_courses_url, notice: 'Módulo foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @categories = Category.where(parent_id: nil)
    if @course.update(course_params)
      redirect_to admin_courses_url, notice: 'Módulo foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    redirect_to admin_courses_url, notice: 'Módulo foi apagado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(
        :name, :category_id, :level_id, :price,
        :description, :thumbnail, :certificate,
        :order_number, :active
      )
    end
end

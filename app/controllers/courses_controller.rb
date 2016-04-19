class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  # GET /courses
  # GET /courses.json
  def index
    if(params[:category])
      if params[:level]
        @courses = Course.where('category_id in (?) AND level_id in (?)', params[:category], params[:level]).where(active: true)
      else
        @courses = Course.where('category_id in (?)', params[:category]).where(active: true)
      end
    elsif(params[:level])
      @courses = Course.where('level_id in (?)', params[:level]).where(active: true)
    else
      @courses = Course.where(active: true)
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @allowed =  UserCourse.where(user: current_user, course: @course).present?
  end

  def filter
    if(params[:category])
      if params[:level]
        courses = Course.where('category_id in (?) AND level_id in (?)', params[:category], params[:level])
      else
        courses = Course.where('category_id in (?)', params[:category])
      end
    elsif(params[:level])
      courses = Course.where('level_id in (?)', params[:level])
    else
      courses = Course.all*10
    end

    render json: courses
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.friendly.find(params[:id])
  end
end

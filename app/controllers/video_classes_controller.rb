class VideoClassesController < ApplicationController
  before_action :set_video_class, only: [:show]
  before_action :set_course, only: [:show, :index]

  # GET /video_classes
  # GET /video_classes.json
  def index
    @video_classes = @course.video_classes
  end

  # GET /video_classes/1
  # GET /video_classes/1.json
  def show
    @allowed =  @video_class.free? || UserVideo.where(
                  user: current_user,
                  video_class: @video_class
                ).present? || UserCourse.where(
                  user: current_user,
                  course: @course
                ).present? || (current_user && current_user.admin?)
  end

  def all_classes
    if params[:price].present?
      @video_classes = VideoClass.joins(:courses).where(courses: {active: true})
                        .where('video_classes.price >= ? and video_classes.price <= ?', params[:price].to_i, params[:price].to_i + 1)
                        .order(id: :asc)
    else
      @video_classes = VideoClass.joins(:courses).where(courses: {active: true}).order(id: :asc)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video_class
    @video_class = VideoClass.friendly.find(params[:id])
  end

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end
end

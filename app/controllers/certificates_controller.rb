class CertificatesController < ApplicationController
  before_action :set_course, only: [:show, :index]

  def show
    if allowed
      render pdf:                            @course.slug,
             disposition:                    'attachment',                 # default 'inline'
             template:                       'certificates/show.pdf.erb',
             orientation:                    'Landscape',                  # default Portrait
             page_size:                      'A4',
             show_as_html:                   params.key?('debug'),         # allow debugging based on url param
             margin:  {   top:               0,                     # default 10 (mm)
                          bottom:            0,
                          left:              0,
                          right:             0 }
    end
  end

  private
  def set_course
    @course = Course.friendly.find(params[:course_id])
  end

  def allowed
    UserCourse.where(
      user: current_user,
      course: @course
    ).present?
  end
end
class Admin::DashboardController < Admin::ApplicationController
  def index
    @last_users = User.where('created_at > ?', 1.day.ago)
    @last_orders = Order.where('created_at > ?', 1.day.ago)
    @last_video_classes = UserVideo.where('created_at > ?', 1.day.ago)
    @last_courses = UserCourse.where('created_at > ?', 1.day.ago)
    @users_created_by_day = User.group("DATE(created_at)").count.sort_by {|k,v| k}.reverse.slice(0,10)
    @orders_created_by_day = Order.group("DATE(created_at)").count.sort_by {|k,v| k}.reverse.slice(0,10)
    @video_classes_payed_by_day = UserVideo.group("DATE(created_at)").count.sort_by {|k,v| k}.reverse.slice(0,10)
    @courses_payed_by_day = UserCourse.group("DATE(created_at)").count.sort_by {|k,v| k}.reverse.slice(0,10)
    @video_classes_value_by_day = VideoClass.joins(:user_videos).group('DATE(user_videos.created_at)').sum(:price).sort_by {|k,v| k}.reverse.slice(0,10)
    @courses_value_by_day = Course.joins(:user_courses).group('DATE(user_courses.created_at)').sum(:price).sort_by {|k,v| k}.reverse.slice(0,10)
  end
end
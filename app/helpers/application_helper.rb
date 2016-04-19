module ApplicationHelper
  def body_class
    "#{controller_name} #{controller_name}-#{controller.action_name} #{page_id}"
  end

  def controller_name
    controller.controller_path.gsub('/','-')
  end

  def page_id
    params['id']
  end

  def body_id
    "page-#{controller_name}"
  end

  def flash_message(kind, &block)
    css = ['global', 'alert']

    case kind.to_sym
    when :notice then css << 'alert-success'
    when :alert  then css << 'alert-warning'
    end

    content_tag :div, class: css, data: { alert_hide: true }, &block
  end

  def duration(duration)
    Time.at(duration).utc.strftime("%H:%M:%S")
  end

  def video_classes_price_by_date(date)
    VideoClass.joins(:user_videos).where(
      { user_videos: {
        created_at: (date.beginning_of_day..date.end_of_day)
        }
      }
    ).sum(:price)
  end

  def courses_price_by_date(date)
    Course.joins(:user_courses).group('DATE(created_at)').sum(:price)
  end

  def format_phone(phone)
    if phone.size == 10
     "(#{phone[0..1]}) #{phone[2..5]}-#{phone[6..9]}"
    else
      "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..10]}"
    end
  end
end
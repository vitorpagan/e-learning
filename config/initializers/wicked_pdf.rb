WickedPdf.config do |config|
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  if Rails.env == 'production' then
    config.exe_path = Rails.root.to_s + "/bin/wkhtmltopdf"
  else
    config.exe_path = '/Users/vitorpagan/.rvm/gems/ruby-2.1.3/bin/wkhtmltopdf'
  end
end

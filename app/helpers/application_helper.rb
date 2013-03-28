module ApplicationHelper
  def date_string(date)
    date.strftime("%y-%m-%d")
  end
  def datetime_string(datetime)
    datetime.strftime("%Y-%m-%d %H:%M:%S") if datetime
  end
end

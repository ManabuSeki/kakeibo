module ApplicationHelper
  def format_at(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    return time.strftime("%Y年%m月%d日")
  end

  def format_date(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    date_of_week = %w(日 月 火 水 木 金 土)[time.wday]
    return time.strftime("%m月%d日(#{date_of_week})")
  end

  def format_day(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    return time.strftime("%m月%d日")
  end

  def format_year(time)
    return time unless time
    return time.strftime("%Y年%m月")
  end

  def format_id(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    return time.strftime("%Y%m%d")
  end

  def prev_month(time)
    return time unless time
    return time.prev_month.strftime("%Y%m")
  end

  def next_month(time)
    return time unless time
    return time.next_month.strftime("%Y%m")
  end
    
end

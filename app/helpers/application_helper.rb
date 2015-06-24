module ApplicationHelper
  def format_at(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    return time.strftime("%Y年%m月%d日")
  end

  def format_id(time)
    return time unless time
    #return time.strftime("%Y/%m/%d")
    return time.strftime("%Y%m%d")
  end
end

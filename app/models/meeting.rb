class Meeting < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
end

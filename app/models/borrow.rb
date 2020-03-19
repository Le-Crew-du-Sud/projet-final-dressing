class Borrow < ApplicationRecord
  # set default value of start_date for today (source: https://stackoverflow.com/a/9092686/9439795 //answer 1)
  def after_initialize
    self.start_date ||= Date.today if new_record?
  end
end

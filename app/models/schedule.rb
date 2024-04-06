class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :memo, length: { maximum: 500 }
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if enddate.blank? || startdate.blank?

    if enddate < startdate
      errors.add(:enddate, 'は開始日よりも後の日付でなければなりません')
    end
  end
end

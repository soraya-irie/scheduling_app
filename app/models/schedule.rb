class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :memo, length: { maximum: 500 }
end

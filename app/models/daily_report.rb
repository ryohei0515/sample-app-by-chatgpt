class DailyReport < ApplicationRecord
  belongs_to :user
  has_many :work_items, dependent: :destroy
  accepts_nested_attributes_for :work_items, allow_destroy: true
end

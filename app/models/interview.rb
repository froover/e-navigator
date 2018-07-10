class Interview < ApplicationRecord
  belongs_to :user
  validates :interview_date, presence: true
end

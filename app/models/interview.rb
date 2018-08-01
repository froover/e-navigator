class Interview < ApplicationRecord
  belongs_to :user
  validates :interview_date, presence: true
  enum approval: { hold: 0, approved: 1, rejected: 2 }
end

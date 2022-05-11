# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :project
  has_many :bugs_users, dependent: :destroy
  has_many :users, through: :bugs_users, dependent: :destroy

  has_one_attached :screenshot

  validates :screenshot, content_type: ['image/png', 'image/gif']
  validates :title, presence: true, uniqueness: true

  enum bug_type: {
    bug: 1,
    feature: 2
  }

  enum status: {
    New: 1,
    started: 2,
    resolved: 3,
    completed: 4
  }
end

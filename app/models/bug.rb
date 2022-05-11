# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :project
  has_many :bugs_users, dependent: :destroy
  has_many :users, through: :bugs_users, dependent: :destroy

  has_one_attached :screenshot

  validates :screenshot, content_type: ['image/png', 'image/gif']
  validates :title, presence: true, uniqueness: true

  enum type_of: {
    bug: 1,
    feature: 2
  }

  enum status_is: {
    New: 10,
    started: 20,
    resolved: 30,
    completed: 40
  }
end

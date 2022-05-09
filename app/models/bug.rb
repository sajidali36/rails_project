# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :project
  has_many :bugs_users
  has_many :users, through: :bugs_users

  has_one_attached :screenshot

  validates :screenshot, content_type: ['image/png', 'image/gif']
  validates :title, presence: true, uniqueness: true
end

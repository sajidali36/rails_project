# frozen_string_literal: true

class ProjectsUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
end

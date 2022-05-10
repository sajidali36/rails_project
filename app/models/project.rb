# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :projects_users, dependent: :destroy
  has_many :users, through: :projects_users, dependent: :destroy
  has_many :bugs, dependent: :destroy
end

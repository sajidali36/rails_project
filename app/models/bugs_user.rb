# frozen_string_literal: true

class BugsUser < ApplicationRecord
  belongs_to :bug
  belongs_to :user

  validates_uniqueness_of :bug_id, scope: :user_id
end

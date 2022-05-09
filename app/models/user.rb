# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects_users
  has_many :projects, through: :projects_users

  has_many :bugs_users
  has_many :bugs, through: :bugs_users

  enum user_type: {
    manager: 0,
    developer: 1,
    qa: 2
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
end

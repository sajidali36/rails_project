# frozen_string_literal: true

class TestBackgroundJobsController < ApplicationController
  def index
    ExampleJob.perform_later
    UserMailer.welcome_email.deliver_later
  end
end

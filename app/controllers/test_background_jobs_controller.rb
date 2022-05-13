# frozen_string_literal: true

class TestBackgroundJobsController < ApplicationController
  def index
    ExampleJob.perform_now
    UserMailer.welcome_email.deliver_later
  end
end

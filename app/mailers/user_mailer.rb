# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    # @user = params[:user]
    @user = User.find(4)
    @url = 'https://www.w3schools.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

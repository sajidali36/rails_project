# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'sajid.forsendemail@gmail.com'

  def welcome_email
    # @user = params[:user]
    @user = User.find(4)
    @url = 'https://www.w3schools.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def bug_created(user)
    mail(to: user.email, subject: 'new Bug is created')
  end
end

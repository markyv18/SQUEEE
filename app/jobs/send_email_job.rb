class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    UserMailer.welcome_email(@user).deliver_later
  end
end

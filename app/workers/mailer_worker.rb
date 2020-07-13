class MailerWorker
  include Sidekiq::Worker

  def perform(scheduled_email_id, user_id)
  	scheduled_email = ScheduledEmail.find(scheduled_email_id)
  	user = User.find(user_id)
    ScheduleEmailsMailer.send_update(scheduled_email, user).deliver
  end
end
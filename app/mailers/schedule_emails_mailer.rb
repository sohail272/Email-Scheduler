class ScheduleEmailsMailer < ApplicationMailer

	def send_update email_detail, user
		smtp_settings = user.smtp_setting
		options = {
            :address              => smtp_settings["address"],
            :domain               => smtp_settings["domain"],
            :port                 => smtp_settings["port"].to_i,
            :user_name            => smtp_settings["username"],
            :password             => smtp_settings["password"],
            :authentication       => 'plain',
            :enable_starttls_auto => true,
            :openssl_verify_mode  => 'none'
        }

        Mail.defaults do
            delivery_method :smtp, options
        end

        mail = Mail.new do
            from      "no-reply@scheduler.com"
            to        email_detail.send_to
            subject   email_detail.subject
            html_part do
                content_type 'text/html; charset=UTF-8'
                body email_detail.body
            end
        end
        mail.deliver!
	end
end

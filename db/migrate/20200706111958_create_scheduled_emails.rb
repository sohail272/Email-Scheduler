class CreateScheduledEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_emails do |t|
    	t.string :send_to
    	t.string :subject
    	t.string :body
    	t.datetime :sending_time
    	t.string :status

    	t.belongs_to :user

      t.timestamps
    end
  end
end

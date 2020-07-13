class CreateSmtpSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :smtp_settings do |t|
    	t.string :address
    	t.string :port
    	t.string :username
    	t.string :password

    	t.belongs_to :user

      t.timestamps
    end
  end
end

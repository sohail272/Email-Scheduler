namespace :user do
  desc "TODO"
  task create_admin: :environment do
  	Admin.create(email: "admin_example.com", password: "test123")
  end

end

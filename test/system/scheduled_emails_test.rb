require "application_system_test_case"

class ScheduledEmailsTest < ApplicationSystemTestCase
  setup do
    @scheduled_email = scheduled_emails(:one)
  end

  test "visiting the index" do
    visit scheduled_emails_url
    assert_selector "h1", text: "Scheduled Emails"
  end

  test "creating a Scheduled email" do
    visit scheduled_emails_url
    click_on "New Scheduled Email"

    click_on "Create Scheduled email"

    assert_text "Scheduled email was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled email" do
    visit scheduled_emails_url
    click_on "Edit", match: :first

    click_on "Update Scheduled email"

    assert_text "Scheduled email was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled email" do
    visit scheduled_emails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled email was successfully destroyed"
  end
end

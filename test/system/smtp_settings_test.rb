require "application_system_test_case"

class SmtpSettingsTest < ApplicationSystemTestCase
  setup do
    @smtp_setting = smtp_settings(:one)
  end

  test "visiting the index" do
    visit smtp_settings_url
    assert_selector "h1", text: "Smtp Settings"
  end

  test "creating a Smtp setting" do
    visit smtp_settings_url
    click_on "New Smtp Setting"

    click_on "Create Smtp setting"

    assert_text "Smtp setting was successfully created"
    click_on "Back"
  end

  test "updating a Smtp setting" do
    visit smtp_settings_url
    click_on "Edit", match: :first

    click_on "Update Smtp setting"

    assert_text "Smtp setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Smtp setting" do
    visit smtp_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smtp setting was successfully destroyed"
  end
end

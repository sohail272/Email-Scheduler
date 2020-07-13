require 'test_helper'

class SmtpSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smtp_setting = smtp_settings(:one)
  end

  test "should get index" do
    get smtp_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_smtp_setting_url
    assert_response :success
  end

  test "should create smtp_setting" do
    assert_difference('SmtpSetting.count') do
      post smtp_settings_url, params: { smtp_setting: {  } }
    end

    assert_redirected_to smtp_setting_url(SmtpSetting.last)
  end

  test "should show smtp_setting" do
    get smtp_setting_url(@smtp_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_smtp_setting_url(@smtp_setting)
    assert_response :success
  end

  test "should update smtp_setting" do
    patch smtp_setting_url(@smtp_setting), params: { smtp_setting: {  } }
    assert_redirected_to smtp_setting_url(@smtp_setting)
  end

  test "should destroy smtp_setting" do
    assert_difference('SmtpSetting.count', -1) do
      delete smtp_setting_url(@smtp_setting)
    end

    assert_redirected_to smtp_settings_url
  end
end

require "test_helper"

class ThreatControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get threat_name_url
    assert_response :success
  end

  test "should get contact" do
    get threat_contact_url
    assert_response :success
  end

  test "should get severity" do
    get threat_severity_url
    assert_response :success
  end

  test "should get preview" do
    get threat_preview_url
    assert_response :success
  end

  test "should get display" do
    get threat_display_url
    assert_response :success
  end
end

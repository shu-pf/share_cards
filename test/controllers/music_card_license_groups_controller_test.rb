require 'test_helper'

class MusicCardLicenseGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get music_card_license_groups_new_url
    assert_response :success
  end

end

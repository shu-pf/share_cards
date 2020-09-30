require 'test_helper'

class MusicCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get music_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get music_cards_new_url
    assert_response :success
  end

end

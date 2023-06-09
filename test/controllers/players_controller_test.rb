require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get players_index_url
    assert_response :success
  end

  test "should get edit" do
    get players_edit_url
    assert_response :success
  end

  test "should get show" do
    get players_show_url
    assert_response :success
  end

  test "should get new" do
    get players_new_url
    assert_response :success
  end

  test "should get _form" do
    get players__form_url
    assert_response :success
  end

  test "should get _player" do
    get players__player_url
    assert_response :success
  end
end

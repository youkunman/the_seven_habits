require 'test_helper'

class RootsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get roots_show_url
    assert_response :success
  end

  test "should get index" do
    get roots_index_url
    assert_response :success
  end

  test "should get new" do
    get roots_new_url
    assert_response :success
  end

  test "should get editnew" do
    get roots_editnew_url
    assert_response :success
  end

  test "should get edit" do
    get roots_edit_url
    assert_response :success
  end

end

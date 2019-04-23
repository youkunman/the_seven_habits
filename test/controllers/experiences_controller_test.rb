require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experiences_index_url
    assert_response :success
  end

  test "should get show" do
    get experiences_show_url
    assert_response :success
  end

  test "should get create" do
    get experiences_create_url
    assert_response :success
  end

  test "should get destroy" do
    get experiences_destroy_url
    assert_response :success
  end

end

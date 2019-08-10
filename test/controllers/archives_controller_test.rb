require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archives_index_url
    assert_response :success
  end

  test "should get new" do
    get archives_new_url
    assert_response :success
  end

  test "should get create" do
    get archives_create_url
    assert_response :success
  end

  test "should get destroy" do
    get archives_destroy_url
    assert_response :success
  end

end

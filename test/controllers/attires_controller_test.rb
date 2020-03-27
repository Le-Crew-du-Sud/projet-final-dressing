require 'test_helper'

class AttiresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attires_index_url
    assert_response :success
  end

  test "should get create" do
    get attires_create_url
    assert_response :success
  end

end

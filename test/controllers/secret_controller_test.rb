require 'test_helper'

class SecretControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get secret_index_url
    assert_response :success
  end

end

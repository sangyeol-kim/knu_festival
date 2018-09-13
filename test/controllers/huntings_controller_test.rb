require 'test_helper'

class HuntingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hunting = huntings(:one)
  end

  test "should get index" do
    get huntings_url
    assert_response :success
  end

  test "should get new" do
    get new_hunting_url
    assert_response :success
  end

  test "should create hunting" do
    assert_difference('Hunting.count') do
      post huntings_url, params: { hunting: { content: @hunting.content, title: @hunting.title } }
    end

    assert_redirected_to hunting_url(Hunting.last)
  end

  test "should show hunting" do
    get hunting_url(@hunting)
    assert_response :success
  end

  test "should get edit" do
    get edit_hunting_url(@hunting)
    assert_response :success
  end

  test "should update hunting" do
    patch hunting_url(@hunting), params: { hunting: { content: @hunting.content, title: @hunting.title } }
    assert_redirected_to hunting_url(@hunting)
  end

  test "should destroy hunting" do
    assert_difference('Hunting.count', -1) do
      delete hunting_url(@hunting)
    end

    assert_redirected_to huntings_url
  end
end

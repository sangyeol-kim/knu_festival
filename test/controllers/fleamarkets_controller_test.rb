require 'test_helper'

class FleamarketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fleamarket = fleamarkets(:one)
  end

  test "should get index" do
    get fleamarkets_url
    assert_response :success
  end

  test "should get new" do
    get new_fleamarket_url
    assert_response :success
  end

  test "should create fleamarket" do
    assert_difference('Fleamarket.count') do
      post fleamarkets_url, params: { fleamarket: { image: @fleamarket.image, text: @fleamarket.text, title: @fleamarket.title } }
    end

    assert_redirected_to fleamarket_url(Fleamarket.last)
  end

  test "should show fleamarket" do
    get fleamarket_url(@fleamarket)
    assert_response :success
  end

  test "should get edit" do
    get edit_fleamarket_url(@fleamarket)
    assert_response :success
  end

  test "should update fleamarket" do
    patch fleamarket_url(@fleamarket), params: { fleamarket: { image: @fleamarket.image, text: @fleamarket.text, title: @fleamarket.title } }
    assert_redirected_to fleamarket_url(@fleamarket)
  end

  test "should destroy fleamarket" do
    assert_difference('Fleamarket.count', -1) do
      delete fleamarket_url(@fleamarket)
    end

    assert_redirected_to fleamarkets_url
  end
end

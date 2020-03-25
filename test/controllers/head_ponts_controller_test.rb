require 'test_helper'

class HeadPontsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @head_pont = head_ponts(:one)
  end

  test "should get index" do
    get head_ponts_url
    assert_response :success
  end

  test "should get new" do
    get new_head_pont_url
    assert_response :success
  end

  test "should create head_pont" do
    assert_difference('HeadPont.count') do
      post head_ponts_url, params: { head_pont: { head_pont_type_id: @head_pont.head_pont_type_id, number: @head_pont.number, status: @head_pont.status, user_id: @head_pont.user_id } }
    end

    assert_redirected_to head_pont_url(HeadPont.last)
  end

  test "should show head_pont" do
    get head_pont_url(@head_pont)
    assert_response :success
  end

  test "should get edit" do
    get edit_head_pont_url(@head_pont)
    assert_response :success
  end

  test "should update head_pont" do
    patch head_pont_url(@head_pont), params: { head_pont: { head_pont_type_id: @head_pont.head_pont_type_id, number: @head_pont.number, status: @head_pont.status, user_id: @head_pont.user_id } }
    assert_redirected_to head_pont_url(@head_pont)
  end

  test "should destroy head_pont" do
    assert_difference('HeadPont.count', -1) do
      delete head_pont_url(@head_pont)
    end

    assert_redirected_to head_ponts_url
  end
end

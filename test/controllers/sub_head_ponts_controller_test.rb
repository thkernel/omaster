require 'test_helper'

class SubHeadPontsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_head_pont = sub_head_ponts(:one)
  end

  test "should get index" do
    get sub_head_ponts_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_head_pont_url
    assert_response :success
  end

  test "should create sub_head_pont" do
    assert_difference('SubHeadPont.count') do
      post sub_head_ponts_url, params: { sub_head_pont: { description: @sub_head_pont.description, number: @sub_head_pont.number, status: @sub_head_pont.status, sub_head_pont_type_id: @sub_head_pont.sub_head_pont_type_id, user_id: @sub_head_pont.user_id } }
    end

    assert_redirected_to sub_head_pont_url(SubHeadPont.last)
  end

  test "should show sub_head_pont" do
    get sub_head_pont_url(@sub_head_pont)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_head_pont_url(@sub_head_pont)
    assert_response :success
  end

  test "should update sub_head_pont" do
    patch sub_head_pont_url(@sub_head_pont), params: { sub_head_pont: { description: @sub_head_pont.description, number: @sub_head_pont.number, status: @sub_head_pont.status, sub_head_pont_type_id: @sub_head_pont.sub_head_pont_type_id, user_id: @sub_head_pont.user_id } }
    assert_redirected_to sub_head_pont_url(@sub_head_pont)
  end

  test "should destroy sub_head_pont" do
    assert_difference('SubHeadPont.count', -1) do
      delete sub_head_pont_url(@sub_head_pont)
    end

    assert_redirected_to sub_head_ponts_url
  end
end

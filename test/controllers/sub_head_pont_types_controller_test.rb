require 'test_helper'

class SubHeadPontTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_head_pont_type = sub_head_pont_types(:one)
  end

  test "should get index" do
    get sub_head_pont_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_head_pont_type_url
    assert_response :success
  end

  test "should create sub_head_pont_type" do
    assert_difference('SubHeadPontType.count') do
      post sub_head_pont_types_url, params: { sub_head_pont_type: { description: @sub_head_pont_type.description, name: @sub_head_pont_type.name, status: @sub_head_pont_type.status } }
    end

    assert_redirected_to sub_head_pont_type_url(SubHeadPontType.last)
  end

  test "should show sub_head_pont_type" do
    get sub_head_pont_type_url(@sub_head_pont_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_head_pont_type_url(@sub_head_pont_type)
    assert_response :success
  end

  test "should update sub_head_pont_type" do
    patch sub_head_pont_type_url(@sub_head_pont_type), params: { sub_head_pont_type: { description: @sub_head_pont_type.description, name: @sub_head_pont_type.name, status: @sub_head_pont_type.status } }
    assert_redirected_to sub_head_pont_type_url(@sub_head_pont_type)
  end

  test "should destroy sub_head_pont_type" do
    assert_difference('SubHeadPontType.count', -1) do
      delete sub_head_pont_type_url(@sub_head_pont_type)
    end

    assert_redirected_to sub_head_pont_types_url
  end
end

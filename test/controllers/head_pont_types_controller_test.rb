require 'test_helper'

class HeadPontTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @head_pont_type = head_pont_types(:one)
  end

  test "should get index" do
    get head_pont_types_url
    assert_response :success
  end

  test "should get new" do
    get new_head_pont_type_url
    assert_response :success
  end

  test "should create head_pont_type" do
    assert_difference('HeadPontType.count') do
      post head_pont_types_url, params: { head_pont_type: { description: @head_pont_type.description, name: @head_pont_type.name, status: @head_pont_type.status } }
    end

    assert_redirected_to head_pont_type_url(HeadPontType.last)
  end

  test "should show head_pont_type" do
    get head_pont_type_url(@head_pont_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_head_pont_type_url(@head_pont_type)
    assert_response :success
  end

  test "should update head_pont_type" do
    patch head_pont_type_url(@head_pont_type), params: { head_pont_type: { description: @head_pont_type.description, name: @head_pont_type.name, status: @head_pont_type.status } }
    assert_redirected_to head_pont_type_url(@head_pont_type)
  end

  test "should destroy head_pont_type" do
    assert_difference('HeadPontType.count', -1) do
      delete head_pont_type_url(@head_pont_type)
    end

    assert_redirected_to head_pont_types_url
  end
end

require 'test_helper'

class SendUnitValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_unit_value = send_unit_values(:one)
  end

  test "should get index" do
    get send_unit_values_url
    assert_response :success
  end

  test "should get new" do
    get new_send_unit_value_url
    assert_response :success
  end

  test "should create send_unit_value" do
    assert_difference('SendUnitValue.count') do
      post send_unit_values_url, params: { send_unit_value: { agent_id: @send_unit_value.agent_id, amount: @send_unit_value.amount, customer_id: @send_unit_value.customer_id, reason: @send_unit_value.reason, user_id: @send_unit_value.user_id } }
    end

    assert_redirected_to send_unit_value_url(SendUnitValue.last)
  end

  test "should show send_unit_value" do
    get send_unit_value_url(@send_unit_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_unit_value_url(@send_unit_value)
    assert_response :success
  end

  test "should update send_unit_value" do
    patch send_unit_value_url(@send_unit_value), params: { send_unit_value: { agent_id: @send_unit_value.agent_id, amount: @send_unit_value.amount, customer_id: @send_unit_value.customer_id, reason: @send_unit_value.reason, user_id: @send_unit_value.user_id } }
    assert_redirected_to send_unit_value_url(@send_unit_value)
  end

  test "should destroy send_unit_value" do
    assert_difference('SendUnitValue.count', -1) do
      delete send_unit_value_url(@send_unit_value)
    end

    assert_redirected_to send_unit_values_url
  end
end

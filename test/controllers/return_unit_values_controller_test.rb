require 'test_helper'

class ReturnUnitValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @return_unit_value = return_unit_values(:one)
  end

  test "should get index" do
    get return_unit_values_url
    assert_response :success
  end

  test "should get new" do
    get new_return_unit_value_url
    assert_response :success
  end

  test "should create return_unit_value" do
    assert_difference('ReturnUnitValue.count') do
      post return_unit_values_url, params: { return_unit_value: { agent_id: @return_unit_value.agent_id, amount: @return_unit_value.amount, customer_id: @return_unit_value.customer_id, reason: @return_unit_value.reason, user_id: @return_unit_value.user_id } }
    end

    assert_redirected_to return_unit_value_url(ReturnUnitValue.last)
  end

  test "should show return_unit_value" do
    get return_unit_value_url(@return_unit_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_return_unit_value_url(@return_unit_value)
    assert_response :success
  end

  test "should update return_unit_value" do
    patch return_unit_value_url(@return_unit_value), params: { return_unit_value: { agent_id: @return_unit_value.agent_id, amount: @return_unit_value.amount, customer_id: @return_unit_value.customer_id, reason: @return_unit_value.reason, user_id: @return_unit_value.user_id } }
    assert_redirected_to return_unit_value_url(@return_unit_value)
  end

  test "should destroy return_unit_value" do
    assert_difference('ReturnUnitValue.count', -1) do
      delete return_unit_value_url(@return_unit_value)
    end

    assert_redirected_to return_unit_values_url
  end
end

require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { address: @customer.address, agent_id: @customer.agent_id, city: @customer.city, company_name: @customer.company_name, contact_name: @customer.contact_name, country: @customer.country, customer_type_id: @customer.customer_type_id, description: @customer.description, email: @customer.email, fleet_number: @customer.fleet_number, personal_phone: @customer.personal_phone, status: @customer.status, user_id: @customer.user_id, work_phone: @customer.work_phone } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { address: @customer.address, agent_id: @customer.agent_id, city: @customer.city, company_name: @customer.company_name, contact_name: @customer.contact_name, country: @customer.country, customer_type_id: @customer.customer_type_id, description: @customer.description, email: @customer.email, fleet_number: @customer.fleet_number, personal_phone: @customer.personal_phone, status: @customer.status, user_id: @customer.user_id, work_phone: @customer.work_phone } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end

require "application_system_test_case"

class ReturnUnitValuesTest < ApplicationSystemTestCase
  setup do
    @return_unit_value = return_unit_values(:one)
  end

  test "visiting the index" do
    visit return_unit_values_url
    assert_selector "h1", text: "Return Unit Values"
  end

  test "creating a Return unit value" do
    visit return_unit_values_url
    click_on "New Return Unit Value"

    fill_in "Agent", with: @return_unit_value.agent_id
    fill_in "Amount", with: @return_unit_value.amount
    fill_in "Customer", with: @return_unit_value.customer_id
    fill_in "Reason", with: @return_unit_value.reason
    fill_in "User", with: @return_unit_value.user_id
    click_on "Create Return unit value"

    assert_text "Return unit value was successfully created"
    click_on "Back"
  end

  test "updating a Return unit value" do
    visit return_unit_values_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @return_unit_value.agent_id
    fill_in "Amount", with: @return_unit_value.amount
    fill_in "Customer", with: @return_unit_value.customer_id
    fill_in "Reason", with: @return_unit_value.reason
    fill_in "User", with: @return_unit_value.user_id
    click_on "Update Return unit value"

    assert_text "Return unit value was successfully updated"
    click_on "Back"
  end

  test "destroying a Return unit value" do
    visit return_unit_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Return unit value was successfully destroyed"
  end
end

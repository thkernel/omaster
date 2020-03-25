require "application_system_test_case"

class SendUnitValuesTest < ApplicationSystemTestCase
  setup do
    @send_unit_value = send_unit_values(:one)
  end

  test "visiting the index" do
    visit send_unit_values_url
    assert_selector "h1", text: "Send Unit Values"
  end

  test "creating a Send unit value" do
    visit send_unit_values_url
    click_on "New Send Unit Value"

    fill_in "Agent", with: @send_unit_value.agent_id
    fill_in "Amount", with: @send_unit_value.amount
    fill_in "Customer", with: @send_unit_value.customer_id
    fill_in "Reason", with: @send_unit_value.reason
    fill_in "User", with: @send_unit_value.user_id
    click_on "Create Send unit value"

    assert_text "Send unit value was successfully created"
    click_on "Back"
  end

  test "updating a Send unit value" do
    visit send_unit_values_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @send_unit_value.agent_id
    fill_in "Amount", with: @send_unit_value.amount
    fill_in "Customer", with: @send_unit_value.customer_id
    fill_in "Reason", with: @send_unit_value.reason
    fill_in "User", with: @send_unit_value.user_id
    click_on "Update Send unit value"

    assert_text "Send unit value was successfully updated"
    click_on "Back"
  end

  test "destroying a Send unit value" do
    visit send_unit_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send unit value was successfully destroyed"
  end
end

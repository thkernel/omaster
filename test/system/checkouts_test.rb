require "application_system_test_case"

class CheckoutsTest < ApplicationSystemTestCase
  setup do
    @checkout = checkouts(:one)
  end

  test "visiting the index" do
    visit checkouts_url
    assert_selector "h1", text: "Checkouts"
  end

  test "creating a Checkout" do
    visit checkouts_url
    click_on "New Checkout"

    fill_in "Current balance", with: @checkout.current_balance
    fill_in "Maximum balance", with: @checkout.maximum_balance
    fill_in "Minimumbalance", with: @checkout.minimumbalance
    fill_in "Name", with: @checkout.name
    fill_in "Status", with: @checkout.status
    fill_in "User", with: @checkout.user_id
    click_on "Create Checkout"

    assert_text "Checkout was successfully created"
    click_on "Back"
  end

  test "updating a Checkout" do
    visit checkouts_url
    click_on "Edit", match: :first

    fill_in "Current balance", with: @checkout.current_balance
    fill_in "Maximum balance", with: @checkout.maximum_balance
    fill_in "Minimumbalance", with: @checkout.minimumbalance
    fill_in "Name", with: @checkout.name
    fill_in "Status", with: @checkout.status
    fill_in "User", with: @checkout.user_id
    click_on "Update Checkout"

    assert_text "Checkout was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkout" do
    visit checkouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkout was successfully destroyed"
  end
end

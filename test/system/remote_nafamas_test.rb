require "application_system_test_case"

class RemoteNafamasTest < ApplicationSystemTestCase
  setup do
    @remote_nafama = remote_nafamas(:one)
  end

  test "visiting the index" do
    visit remote_nafamas_url
    assert_selector "h1", text: "Remote Nafamas"
  end

  test "creating a Remote nafama" do
    visit remote_nafamas_url
    click_on "New Remote Nafama"

    fill_in "Amount", with: @remote_nafama.amount
    fill_in "Customer", with: @remote_nafama.customer_id
    fill_in "Status", with: @remote_nafama.status
    fill_in "User", with: @remote_nafama.user_id
    click_on "Create Remote nafama"

    assert_text "Remote nafama was successfully created"
    click_on "Back"
  end

  test "updating a Remote nafama" do
    visit remote_nafamas_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @remote_nafama.amount
    fill_in "Customer", with: @remote_nafama.customer_id
    fill_in "Status", with: @remote_nafama.status
    fill_in "User", with: @remote_nafama.user_id
    click_on "Update Remote nafama"

    assert_text "Remote nafama was successfully updated"
    click_on "Back"
  end

  test "destroying a Remote nafama" do
    visit remote_nafamas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Remote nafama was successfully destroyed"
  end
end

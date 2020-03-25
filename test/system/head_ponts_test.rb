require "application_system_test_case"

class HeadPontsTest < ApplicationSystemTestCase
  setup do
    @head_pont = head_ponts(:one)
  end

  test "visiting the index" do
    visit head_ponts_url
    assert_selector "h1", text: "Head Ponts"
  end

  test "creating a Head pont" do
    visit head_ponts_url
    click_on "New Head Pont"

    fill_in "Head pont type", with: @head_pont.head_pont_type_id
    fill_in "Number", with: @head_pont.number
    fill_in "Status", with: @head_pont.status
    fill_in "User", with: @head_pont.user_id
    click_on "Create Head pont"

    assert_text "Head pont was successfully created"
    click_on "Back"
  end

  test "updating a Head pont" do
    visit head_ponts_url
    click_on "Edit", match: :first

    fill_in "Head pont type", with: @head_pont.head_pont_type_id
    fill_in "Number", with: @head_pont.number
    fill_in "Status", with: @head_pont.status
    fill_in "User", with: @head_pont.user_id
    click_on "Update Head pont"

    assert_text "Head pont was successfully updated"
    click_on "Back"
  end

  test "destroying a Head pont" do
    visit head_ponts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Head pont was successfully destroyed"
  end
end

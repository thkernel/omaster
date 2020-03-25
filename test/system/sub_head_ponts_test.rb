require "application_system_test_case"

class SubHeadPontsTest < ApplicationSystemTestCase
  setup do
    @sub_head_pont = sub_head_ponts(:one)
  end

  test "visiting the index" do
    visit sub_head_ponts_url
    assert_selector "h1", text: "Sub Head Ponts"
  end

  test "creating a Sub head pont" do
    visit sub_head_ponts_url
    click_on "New Sub Head Pont"

    fill_in "Description", with: @sub_head_pont.description
    fill_in "Number", with: @sub_head_pont.number
    fill_in "Status", with: @sub_head_pont.status
    fill_in "Sub head pont type", with: @sub_head_pont.sub_head_pont_type_id
    fill_in "User", with: @sub_head_pont.user_id
    click_on "Create Sub head pont"

    assert_text "Sub head pont was successfully created"
    click_on "Back"
  end

  test "updating a Sub head pont" do
    visit sub_head_ponts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sub_head_pont.description
    fill_in "Number", with: @sub_head_pont.number
    fill_in "Status", with: @sub_head_pont.status
    fill_in "Sub head pont type", with: @sub_head_pont.sub_head_pont_type_id
    fill_in "User", with: @sub_head_pont.user_id
    click_on "Update Sub head pont"

    assert_text "Sub head pont was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub head pont" do
    visit sub_head_ponts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub head pont was successfully destroyed"
  end
end

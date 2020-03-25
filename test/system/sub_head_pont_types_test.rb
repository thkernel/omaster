require "application_system_test_case"

class SubHeadPontTypesTest < ApplicationSystemTestCase
  setup do
    @sub_head_pont_type = sub_head_pont_types(:one)
  end

  test "visiting the index" do
    visit sub_head_pont_types_url
    assert_selector "h1", text: "Sub Head Pont Types"
  end

  test "creating a Sub head pont type" do
    visit sub_head_pont_types_url
    click_on "New Sub Head Pont Type"

    fill_in "Description", with: @sub_head_pont_type.description
    fill_in "Name", with: @sub_head_pont_type.name
    fill_in "Status", with: @sub_head_pont_type.status
    click_on "Create Sub head pont type"

    assert_text "Sub head pont type was successfully created"
    click_on "Back"
  end

  test "updating a Sub head pont type" do
    visit sub_head_pont_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sub_head_pont_type.description
    fill_in "Name", with: @sub_head_pont_type.name
    fill_in "Status", with: @sub_head_pont_type.status
    click_on "Update Sub head pont type"

    assert_text "Sub head pont type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub head pont type" do
    visit sub_head_pont_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub head pont type was successfully destroyed"
  end
end

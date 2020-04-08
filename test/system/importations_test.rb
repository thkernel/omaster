require "application_system_test_case"

class ImportationsTest < ApplicationSystemTestCase
  setup do
    @importation = importations(:one)
  end

  test "visiting the index" do
    visit importations_url
    assert_selector "h1", text: "Importations"
  end

  test "creating a Importation" do
    visit importations_url
    click_on "New Importation"

    fill_in "File name", with: @importation.file_name
    fill_in "Status", with: @importation.status
    fill_in "Uid", with: @importation.uid
    fill_in "User", with: @importation.user_id
    click_on "Create Importation"

    assert_text "Importation was successfully created"
    click_on "Back"
  end

  test "updating a Importation" do
    visit importations_url
    click_on "Edit", match: :first

    fill_in "File name", with: @importation.file_name
    fill_in "Status", with: @importation.status
    fill_in "Uid", with: @importation.uid
    fill_in "User", with: @importation.user_id
    click_on "Update Importation"

    assert_text "Importation was successfully updated"
    click_on "Back"
  end

  test "destroying a Importation" do
    visit importations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Importation was successfully destroyed"
  end
end

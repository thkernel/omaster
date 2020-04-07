require "application_system_test_case"

class RemoteUvsTest < ApplicationSystemTestCase
  setup do
    @remote_uv = remote_uvs(:one)
  end

  test "visiting the index" do
    visit remote_uvs_url
    assert_selector "h1", text: "Remote Uvs"
  end

  test "creating a Remote uv" do
    visit remote_uvs_url
    click_on "New Remote Uv"

    fill_in "Amount", with: @remote_uv.amount
    fill_in "Shop", with: @remote_uv.shop_id
    fill_in "Status", with: @remote_uv.status
    fill_in "User", with: @remote_uv.user_id
    click_on "Create Remote uv"

    assert_text "Remote uv was successfully created"
    click_on "Back"
  end

  test "updating a Remote uv" do
    visit remote_uvs_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @remote_uv.amount
    fill_in "Shop", with: @remote_uv.shop_id
    fill_in "Status", with: @remote_uv.status
    fill_in "User", with: @remote_uv.user_id
    click_on "Update Remote uv"

    assert_text "Remote uv was successfully updated"
    click_on "Back"
  end

  test "destroying a Remote uv" do
    visit remote_uvs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Remote uv was successfully destroyed"
  end
end

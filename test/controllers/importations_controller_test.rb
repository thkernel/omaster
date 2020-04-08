require 'test_helper'

class ImportationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @importation = importations(:one)
  end

  test "should get index" do
    get importations_url
    assert_response :success
  end

  test "should get new" do
    get new_importation_url
    assert_response :success
  end

  test "should create importation" do
    assert_difference('Importation.count') do
      post importations_url, params: { importation: { file_name: @importation.file_name, status: @importation.status, uid: @importation.uid, user_id: @importation.user_id } }
    end

    assert_redirected_to importation_url(Importation.last)
  end

  test "should show importation" do
    get importation_url(@importation)
    assert_response :success
  end

  test "should get edit" do
    get edit_importation_url(@importation)
    assert_response :success
  end

  test "should update importation" do
    patch importation_url(@importation), params: { importation: { file_name: @importation.file_name, status: @importation.status, uid: @importation.uid, user_id: @importation.user_id } }
    assert_redirected_to importation_url(@importation)
  end

  test "should destroy importation" do
    assert_difference('Importation.count', -1) do
      delete importation_url(@importation)
    end

    assert_redirected_to importations_url
  end
end

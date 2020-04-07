require 'test_helper'

class RemoteUVsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @remote_uv = remote_uvs(:one)
  end

  test "should get index" do
    get remote_uvs_url
    assert_response :success
  end

  test "should get new" do
    get new_remote_uv_url
    assert_response :success
  end

  test "should create remote_uv" do
    assert_difference('RemoteUv.count') do
      post remote_uvs_url, params: { remote_uv: { amount: @remote_uv.amount, shop_id: @remote_uv.shop_id, status: @remote_uv.status, user_id: @remote_uv.user_id } }
    end

    assert_redirected_to remote_uv_url(RemoteUv.last)
  end

  test "should show remote_uv" do
    get remote_uv_url(@remote_uv)
    assert_response :success
  end

  test "should get edit" do
    get edit_remote_uv_url(@remote_uv)
    assert_response :success
  end

  test "should update remote_uv" do
    patch remote_uv_url(@remote_uv), params: { remote_uv: { amount: @remote_uv.amount, shop_id: @remote_uv.shop_id, status: @remote_uv.status, user_id: @remote_uv.user_id } }
    assert_redirected_to remote_uv_url(@remote_uv)
  end

  test "should destroy remote_uv" do
    assert_difference('RemoteUv.count', -1) do
      delete remote_uv_url(@remote_uv)
    end

    assert_redirected_to remote_uvs_url
  end
end

require 'test_helper'

class RemoteNafamasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @remote_nafama = remote_nafamas(:one)
  end

  test "should get index" do
    get remote_nafamas_url
    assert_response :success
  end

  test "should get new" do
    get new_remote_nafama_url
    assert_response :success
  end

  test "should create remote_nafama" do
    assert_difference('RemoteNafama.count') do
      post remote_nafamas_url, params: { remote_nafama: { amount: @remote_nafama.amount, customer_id: @remote_nafama.customer_id, status: @remote_nafama.status, user_id: @remote_nafama.user_id } }
    end

    assert_redirected_to remote_nafama_url(RemoteNafama.last)
  end

  test "should show remote_nafama" do
    get remote_nafama_url(@remote_nafama)
    assert_response :success
  end

  test "should get edit" do
    get edit_remote_nafama_url(@remote_nafama)
    assert_response :success
  end

  test "should update remote_nafama" do
    patch remote_nafama_url(@remote_nafama), params: { remote_nafama: { amount: @remote_nafama.amount, customer_id: @remote_nafama.customer_id, status: @remote_nafama.status, user_id: @remote_nafama.user_id } }
    assert_redirected_to remote_nafama_url(@remote_nafama)
  end

  test "should destroy remote_nafama" do
    assert_difference('RemoteNafama.count', -1) do
      delete remote_nafama_url(@remote_nafama)
    end

    assert_redirected_to remote_nafamas_url
  end
end

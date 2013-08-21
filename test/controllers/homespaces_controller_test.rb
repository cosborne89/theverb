require 'test_helper'

class HomespacesControllerTest < ActionController::TestCase
  setup do
    @homespace = homespaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homespaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homespace" do
    assert_difference('Homespace.count') do
      post :create, homespace: { partner_id: @homespace.partner_id, post_ids: @homespace.post_ids, string: @homespace.string, user_id: @homespace.user_id }
    end

    assert_redirected_to homespace_path(assigns(:homespace))
  end

  test "should show homespace" do
    get :show, id: @homespace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homespace
    assert_response :success
  end

  test "should update homespace" do
    patch :update, id: @homespace, homespace: { partner_id: @homespace.partner_id, post_ids: @homespace.post_ids, string: @homespace.string, user_id: @homespace.user_id }
    assert_redirected_to homespace_path(assigns(:homespace))
  end

  test "should destroy homespace" do
    assert_difference('Homespace.count', -1) do
      delete :destroy, id: @homespace
    end

    assert_redirected_to homespaces_path
  end
end

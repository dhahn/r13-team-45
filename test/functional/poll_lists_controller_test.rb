require 'test_helper'

class PollListsControllerTest < ActionController::TestCase
  setup do
    @poll_list = poll_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_list" do
    assert_difference('PollList.count') do
      post :create, poll_list: {  }
    end

    assert_redirected_to poll_list_path(assigns(:poll_list))
  end

  test "should show poll_list" do
    get :show, id: @poll_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_list
    assert_response :success
  end

  test "should update poll_list" do
    put :update, id: @poll_list, poll_list: {  }
    assert_redirected_to poll_list_path(assigns(:poll_list))
  end

  test "should destroy poll_list" do
    assert_difference('PollList.count', -1) do
      delete :destroy, id: @poll_list
    end

    assert_redirected_to poll_lists_path
  end
end

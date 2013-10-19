require 'test_helper'

class BillListsControllerTest < ActionController::TestCase
  setup do
    @bill_list = bill_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_list" do
    assert_difference('BillList.count') do
      post :create, bill_list: {  }
    end

    assert_redirected_to bill_list_path(assigns(:bill_list))
  end

  test "should show bill_list" do
    get :show, id: @bill_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_list
    assert_response :success
  end

  test "should update bill_list" do
    put :update, id: @bill_list, bill_list: {  }
    assert_redirected_to bill_list_path(assigns(:bill_list))
  end

  test "should destroy bill_list" do
    assert_difference('BillList.count', -1) do
      delete :destroy, id: @bill_list
    end

    assert_redirected_to bill_lists_path
  end
end

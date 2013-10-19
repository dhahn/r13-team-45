require 'test_helper'

class RecurringItemsControllerTest < ActionController::TestCase
  setup do
    @recurring_item = recurring_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_item" do
    assert_difference('RecurringItem.count') do
      post :create, recurring_item: {  }
    end

    assert_redirected_to recurring_item_path(assigns(:recurring_item))
  end

  test "should show recurring_item" do
    get :show, id: @recurring_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recurring_item
    assert_response :success
  end

  test "should update recurring_item" do
    put :update, id: @recurring_item, recurring_item: {  }
    assert_redirected_to recurring_item_path(assigns(:recurring_item))
  end

  test "should destroy recurring_item" do
    assert_difference('RecurringItem.count', -1) do
      delete :destroy, id: @recurring_item
    end

    assert_redirected_to recurring_items_path
  end
end

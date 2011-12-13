require 'test_helper'

class UsersWidgetsControllerTest < ActionController::TestCase
  setup do
    @users_widget = users_widgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_widgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_widget" do
    assert_difference('UsersWidget.count') do
      post :create, :users_widget => @users_widget.attributes
    end

    assert_redirected_to users_widget_path(assigns(:users_widget))
  end

  test "should show users_widget" do
    get :show, :id => @users_widget.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @users_widget.to_param
    assert_response :success
  end

  test "should update users_widget" do
    put :update, :id => @users_widget.to_param, :users_widget => @users_widget.attributes
    assert_redirected_to users_widget_path(assigns(:users_widget))
  end

  test "should destroy users_widget" do
    assert_difference('UsersWidget.count', -1) do
      delete :destroy, :id => @users_widget.to_param
    end

    assert_redirected_to users_widgets_path
  end
end

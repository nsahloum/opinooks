require 'test_helper'

class DebatsControllerTest < ActionController::TestCase
  setup do
    @debat = debats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debat" do
    assert_difference('Debat.count') do
      post :create, debat: { description: @debat.description, title: @debat.title }
    end

    assert_redirected_to debat_path(assigns(:debat))
  end

  test "should show debat" do
    get :show, id: @debat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debat
    assert_response :success
  end

  test "should update debat" do
    patch :update, id: @debat, debat: { description: @debat.description, title: @debat.title }
    assert_redirected_to debat_path(assigns(:debat))
  end

  test "should destroy debat" do
    assert_difference('Debat.count', -1) do
      delete :destroy, id: @debat
    end

    assert_redirected_to debats_path
  end
end

require 'test_helper'

class VideoClassesControllerTest < ActionController::TestCase
  setup do
    @video_class = video_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_class" do
    assert_difference('VideoClass.count') do
      post :create, video_class: { description: @video_class.description, duration: @video_class.duration, excerpt: @video_class.excerpt, order: @video_class.order, title: @video_class.title }
    end

    assert_redirected_to video_class_path(assigns(:video_class))
  end

  test "should show video_class" do
    get :show, id: @video_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_class
    assert_response :success
  end

  test "should update video_class" do
    patch :update, id: @video_class, video_class: { description: @video_class.description, duration: @video_class.duration, excerpt: @video_class.excerpt, order: @video_class.order, title: @video_class.title }
    assert_redirected_to video_class_path(assigns(:video_class))
  end

  test "should destroy video_class" do
    assert_difference('VideoClass.count', -1) do
      delete :destroy, id: @video_class
    end

    assert_redirected_to video_classes_path
  end
end

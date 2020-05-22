require 'test_helper'

class CoursesUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_user = courses_users(:one)
  end

  test "should get index" do
    get courses_users_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_user_url
    assert_response :success
  end

  test "should create courses_user" do
    assert_difference('CourseUser.count') do
      post courses_users_url, params: { courses_user: { course_id: @courses_user.course_id, user_id: @courses_user.user_id } }
    end

    assert_redirected_to courses_user_url(CourseUser.last)
  end

  test "should show courses_user" do
    get courses_user_url(@courses_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_user_url(@courses_user)
    assert_response :success
  end

  test "should update courses_user" do
    patch courses_user_url(@courses_user), params: { courses_user: { course_id: @courses_user.course_id, user_id: @courses_user.user_id } }
    assert_redirected_to courses_user_url(@courses_user)
  end

  test "should destroy courses_user" do
    assert_difference('CourseUser.count', -1) do
      delete courses_user_url(@courses_user)
    end

    assert_redirected_to courses_users_url
  end
end

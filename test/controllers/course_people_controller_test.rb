require 'test_helper'

class CoursePeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_person = course_people(:one)
  end

  test "should get index" do
    get course_people_url
    assert_response :success
  end

  test "should get new" do
    get new_course_person_url
    assert_response :success
  end

  test "should create course_person" do
    assert_difference('CoursePerson.count') do
      post course_people_url, params: { course_person: { course_id: @course_person.course_id, person_id: @course_person.person_id } }
    end

    assert_redirected_to course_person_url(CoursePerson.last)
  end

  test "should show course_person" do
    get course_person_url(@course_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_person_url(@course_person)
    assert_response :success
  end

  test "should update course_person" do
    patch course_person_url(@course_person), params: { course_person: { course_id: @course_person.course_id, person_id: @course_person.person_id } }
    assert_redirected_to course_person_url(@course_person)
  end

  test "should destroy course_person" do
    assert_difference('CoursePerson.count', -1) do
      delete course_person_url(@course_person)
    end

    assert_redirected_to course_people_url
  end
end

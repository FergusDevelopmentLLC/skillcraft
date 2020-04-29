require "application_system_test_case"

class CoursePeopleTest < ApplicationSystemTestCase
  setup do
    @course_person = course_people(:one)
  end

  test "visiting the index" do
    visit course_people_url
    assert_selector "h1", text: "Course People"
  end

  test "creating a Course person" do
    visit course_people_url
    click_on "New Course Person"

    fill_in "Course", with: @course_person.course_id
    fill_in "Person", with: @course_person.person_id
    click_on "Create Course person"

    assert_text "Course person was successfully created"
    click_on "Back"
  end

  test "updating a Course person" do
    visit course_people_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_person.course_id
    fill_in "Person", with: @course_person.person_id
    click_on "Update Course person"

    assert_text "Course person was successfully updated"
    click_on "Back"
  end

  test "destroying a Course person" do
    visit course_people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course person was successfully destroyed"
  end
end

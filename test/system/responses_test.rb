require "application_system_test_case"

class ResponsesTest < ApplicationSystemTestCase
  setup do
    @response = responses(:one)
  end

  test "visiting the index" do
    visit responses_url
    assert_selector "h1", text: "Responses"
  end

  test "creating a Response" do
    visit responses_url
    click_on "New Response"

    fill_in "Content", with: @response.content
    fill_in "Interaction", with: @response.interaction_id
    fill_in "Letter grade", with: @response.letter_grade
    fill_in "Score", with: @response.score
    fill_in "Student", with: @response.student_id
    fill_in "Type", with: @response.type
    click_on "Create Response"

    assert_text "Response was successfully created"
    click_on "Back"
  end

  test "updating a Response" do
    visit responses_url
    click_on "Edit", match: :first

    fill_in "Content", with: @response.content
    fill_in "Interaction", with: @response.interaction_id
    fill_in "Letter grade", with: @response.letter_grade
    fill_in "Score", with: @response.score
    fill_in "Student", with: @response.student_id
    fill_in "Type", with: @response.type
    click_on "Update Response"

    assert_text "Response was successfully updated"
    click_on "Back"
  end

  test "destroying a Response" do
    visit responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Response was successfully destroyed"
  end
end

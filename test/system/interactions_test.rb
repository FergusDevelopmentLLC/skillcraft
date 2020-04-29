require "application_system_test_case"

class InteractionsTest < ApplicationSystemTestCase
  setup do
    @interaction = interactions(:one)
  end

  test "visiting the index" do
    visit interactions_url
    assert_selector "h1", text: "Interactions"
  end

  test "creating a Interaction" do
    visit interactions_url
    click_on "New Interaction"

    fill_in "Course", with: @interaction.course_id
    fill_in "Due date", with: @interaction.due_date
    fill_in "End date", with: @interaction.end_date
    check "Graded" if @interaction.graded
    fill_in "Instructions", with: @interaction.instructions
    fill_in "Points", with: @interaction.points
    fill_in "Posted date", with: @interaction.posted_date
    fill_in "Start date", with: @interaction.start_date
    fill_in "Person", with: @interaction.person_id
    fill_in "Title", with: @interaction.title
    fill_in "Type", with: @interaction.type
    click_on "Create Interaction"

    assert_text "Interaction was successfully created"
    click_on "Back"
  end

  test "updating a Interaction" do
    visit interactions_url
    click_on "Edit", match: :first

    fill_in "Course", with: @interaction.course_id
    fill_in "Due date", with: @interaction.due_date
    fill_in "End date", with: @interaction.end_date
    check "Graded" if @interaction.graded
    fill_in "Instructions", with: @interaction.instructions
    fill_in "Points", with: @interaction.points
    fill_in "Posted date", with: @interaction.posted_date
    fill_in "Start date", with: @interaction.start_date
    fill_in "Teacher", with: @interaction.teacher_id
    fill_in "Title", with: @interaction.title
    fill_in "Type", with: @interaction.type
    click_on "Update Interaction"

    assert_text "Interaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Interaction" do
    visit interactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interaction was successfully destroyed"
  end
end

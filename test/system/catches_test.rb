require "application_system_test_case"

class CatchesTest < ApplicationSystemTestCase
  setup do
    @catch = catches(:one)
  end

  test "visiting the index" do
    visit catches_url
    assert_selector "h1", text: "Catches"
  end

  test "should create catch" do
    visit catches_url
    click_on "New catch"

    fill_in "Bait", with: @catch.bait
    fill_in "Date", with: @catch.date
    fill_in "Notes", with: @catch.notes
    fill_in "Species", with: @catch.species
    fill_in "Weather", with: @catch.weather
    click_on "Create Catch"

    assert_text "Catch was successfully created"
    click_on "Back"
  end

  test "should update Catch" do
    visit catch_url(@catch)
    click_on "Edit this catch", match: :first

    fill_in "Bait", with: @catch.bait
    fill_in "Date", with: @catch.date.to_s
    fill_in "Notes", with: @catch.notes
    fill_in "Species", with: @catch.species
    fill_in "Weather", with: @catch.weather
    click_on "Update Catch"

    assert_text "Catch was successfully updated"
    click_on "Back"
  end

  test "should destroy Catch" do
    visit catch_url(@catch)
    click_on "Destroy this catch", match: :first

    assert_text "Catch was successfully destroyed"
  end
end

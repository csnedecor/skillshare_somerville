require "rails_helper"

feature "Create a class" do

  scenario "teacher successfully adds a new class" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit root_path

    click_on "Add a workshop"

    fill_in "Name", with: "A new class"
    fill_in "Description", with: "This is a really cool class on sushi."
    fill_in "Date", with: DateTime.now
    fill_in "Street address", with: "234 Smitt St"
    fill_in "City", with: "Portola Valley"
    fill_in "State", with: "CA"
    fill_in "Zip code", with: "94028"

    click_on "Add Workshop"

    expect(page).to have_content "Successfully added your class!"
    expect(page).to have_content "A new class"
    expect(page).to have_content "This is a really cool class on sushi."
  end
end

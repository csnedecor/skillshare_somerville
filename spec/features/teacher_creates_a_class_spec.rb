require "rails_helper"

feature "Create a workshop" do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit root_path

    click_on "Add a workshop"
  end

  scenario "teacher successfully adds a new workshop" do
    fill_in "Name", with: "A new class"
    fill_in "Description", with: "This is a really cool class on sushi."
    fill_in "Date", with: DateTime.now
    fill_in "Street address", with: "234 Smitt St"
    fill_in "City", with: "Portola Valley"
    fill_in "State", with: "CA"
    fill_in "Zip code", with: "94028"

    click_on "Create Workshop"

    expect(page).to have_content "Successfully added your workshop!"
    expect(page).to have_content "A new class"
    expect(page).to have_content "This is a really cool class on sushi."
  end

  scenario "teacher submits invalid data" do
    click_on "Create Workshop"

    expect(page).to have_content "can't be blank"
  end
end

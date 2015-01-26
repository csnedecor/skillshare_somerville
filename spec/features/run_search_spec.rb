require "rails_helper"

feature "User searches for existing workshops" do

  scenario "user searches with valid data" do

    workshop =FactoryGirl.create(:workshop, name: "Knitting")
    visit workshops_path

    fill_in "search", with: "Knit"
    click_on "Search"

    expect(page).to have_content workshop.name

  end

  scenario 'invalid search' do
    workshop = FactoryGirl.create(:workshop, name: "Knitting")

    user = FactoryGirl.create(:user)
    login_as(user)

    visit edit_user_registration_path(user)
    fill_in "search", with: "asdf"
    click_on "Search"

    expect(page).not_to have_content workshop.name

  end
end

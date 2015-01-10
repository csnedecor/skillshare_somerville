require "rails_helper"

feature "User edits a workshop" do
  context "User is signed in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      @workshop = FactoryGirl.create(:workshop, user: user)
      sign_in(user)
      visit root_path

      click_on @workshop.name
    end

    scenario "User successfully edits a workshop" do
      click_on "Edit Workshop"

      fill_in "Name", with: "A different class"
      fill_in "Description", with: "This is a really cool class on sushi."
      select "2015", from: "workshop_date_1i"
      select "January", from: "workshop_date_2i"
      select "28", from: "workshop_date_3i"
      select "10", from: "workshop_date_4i"
      select "30", from: "workshop_date_5i"
      fill_in "Street address", with: "234 Smitt St"
      fill_in "City", with: "Portola Valley"
      fill_in "State", with: "CA"
      fill_in "Zip code", with: "94028"

      click_on "Update Workshop"

      expect(page).to have_content "Successfully updated your workshop!"
      expect(page).to have_content "A different class"
      expect(page).to have_content "This is a really cool class on sushi"
      expect(page).not_to have_content @workshop.name
      expect(page).not_to have_content @workshop.description
    end

    scenario "User enters invalid information" do
      click_on "Edit Workshop"

      fill_in "Name", with: ""
      fill_in "Description", with: ""
      select "2015", from: "workshop_date_1i"
      select "January", from: "workshop_date_2i"
      select "28", from: "workshop_date_3i"
      select "10", from: "workshop_date_4i"
      select "30", from: "workshop_date_5i"
      fill_in "Street address", with: ""
      fill_in "City", with: ""
      fill_in "State", with: ""
      fill_in "Zip code", with: ""

      click_on "Update Workshop"

      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "Street can't be blank"
      expect(page).to have_content "City can't be blank"
      expect(page).to have_content "State can't be blank"
      expect(page).to have_content "Zip can't be blank"
    end
  end
end

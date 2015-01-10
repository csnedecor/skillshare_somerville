require "rails_helper"

feature "Create registration" do

  scenario "student successfully registers for a workshop" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    workshop = FactoryGirl.create(:workshop, :user_id => user.id)

    visit workshop_path(workshop)

    click_on "Register"

    expect(page).to have_content "Successfully registered!"
  end
end

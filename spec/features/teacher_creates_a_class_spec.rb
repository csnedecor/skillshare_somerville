require "rails_helper"

feature "Create a class" do

  scenario "teacher successfully adds a new class" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit
  end
end

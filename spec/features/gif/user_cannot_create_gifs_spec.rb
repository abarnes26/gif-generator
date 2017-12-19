require 'rails_helper'

describe "a logged in user" do
  context "attempts to create a gif" do
    it "results in an error page" do
      category = create(:category)
      user     = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/gifs"

      expect(page).to_not have_content("All Gifs by Category")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end

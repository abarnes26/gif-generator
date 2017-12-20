require 'rails_helper'

describe "A user is logs in" do
  context "attempts to view another users favorites" do
    it "does not see any content" do
      category = create(:category)
      user = create(:user)
      user1 = create(:user, username: "username1", email: "fame@fame.com")
      gif = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit gifs_path
      expect(page).to have_content("All Gifs!")
      click_button "Favorite!"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit user_favorites_path(user1)

      expect(page).to have_content("Your Favorited Gifs")
      expect(page).to have_no_content("#{category.name}")
    end
  end
end

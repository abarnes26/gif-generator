require 'rails_helper'

describe "A user is not logged in" do
  context "user attempts to view favorite gifs" do
    it "that user sees no content" do
      category = create(:category)
      user = create(:user)
      gif = create(:gif, category: category)

      visit gifs_path

      expect(page).to have_content("All Gifs!")

      click_button "Favorite!"

      expect(current_path).to eq(new_user_path)
    end
  end
end

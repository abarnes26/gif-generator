require 'rails_helper'

describe "A user is logs in" do
  context "marks a gif as a favorite" do
    it "that user can see a list of their favorites" do
      category = create(:category)
      user = create(:user)
      gif = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_content("All Gifs!")

      click_button "Favorite!"

      visit user_favorites_path(user)

      expect(page).to have_content("Your Favorited Gifs")
      expect(page).to have_content("#{category.name}")
    end
  end
end

require 'rails_helper'

describe "A user is logged in" do
  context "marks a gif as a favorite" do
    it "that gif is now located in their favorites" do
      category = create(:category)
      user = create(:user)
      gif = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_content("All Gifs!")

      click_button "Favorite!"

      expect(user.favorites.all.count).to eql(1)
    end
  end
end

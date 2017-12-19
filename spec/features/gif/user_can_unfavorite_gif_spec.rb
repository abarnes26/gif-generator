require 'rails_helper'

describe "A user is logs in" do
  context "views their list of favorites" do
    context "selects to unfavorite a gif" do
      it "removes that gif from their favorites" do
        category = create(:category)
        user = create(:user)
        gif = create(:gif, category: category)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit gifs_path
        click_button "Favorite!"
        visit user_favorites_path(user)

        click_button "Unfavorite This Gif"

        expect(current_path).to eq(user_favorites_path(user))
        expect(page).to have_no_content("#{category.name}")
        expect(user.favorites.all.count).to eql(0)
      end
    end
  end
end

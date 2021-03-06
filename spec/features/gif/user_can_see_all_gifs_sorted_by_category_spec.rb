require 'rails_helper'

describe "A user is logs in" do
  context "views gifs index" do
    it "sees all gifs sorted by category" do
      category = create(:category)
      user = create(:user)
      gif = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_content("All Gifs!")
      expect(page).to have_content("#{category.name}")
    end
  end
end

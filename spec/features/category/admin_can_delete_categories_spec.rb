require "rails_helper"

describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do
	   admin = User.create(username: "penelope",
                         email:     "email@fake.com",
                         password:  "boom",
                         role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_link "Create New Category"
      fill_in "category[name]", with: "Pandas"
      click_button "Create Category"

      expect(current_path).to eq(admin_categories_path)

      click_link "Pandas"

      expect(current_path).to eql("/admin/categories/#{Category.last.id}")

      click_link "Delete This Category"

      expect(current_path).to eql(admin_categories_path)
      expect(page).to have_no_content("Pandas")
    end
  end
end

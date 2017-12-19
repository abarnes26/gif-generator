require "rails_helper"

describe "User visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do
      reset_session!
	    admin = User.create(username: "penelope",
                         email:     "email@fake.com",
                         password:  "boom",
                         role: 1)

      category = Category.create(name: "dog")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_gifs_path

      click_link "Generate New Gif"

      expect(current_path).to eql(new_admin_gif_path)

      select "dog", :from => "gif[category_id]"

      click_button "Create Gif"

      expect(current_path).to eql(admin_gifs_path)
      expect(Gif.all.count).to eql(1)

    end
  end
end

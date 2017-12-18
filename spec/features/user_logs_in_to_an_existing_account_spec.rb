require "rails_helper"

describe "registered user logs in" do
  context "they visit the root page" do
    context "they click log in link" do
      context "they enter username and password" do
        it "logs in a user" do
          user = create(:user)
          visit "/"

          click_on "Log In"

          expect(current_path).to eql(login_path)

          fill_in "username", with: user.username
          fill_in "password", with: user.password

          click_on "Log In"

          expect(page).to have_content("Welcome to your Gif Generator #{user.username}")
        end
      end
    end
  end
end
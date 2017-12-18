context "as default user" do
  it 'does not allow default user to see admin categories index' do
    user = User.create(username: "fern@gully.com",
                       password: "password",
                       email: "email@fake.com",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_categories_path

    expect(page).to_not have_content("Admin Categories")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end

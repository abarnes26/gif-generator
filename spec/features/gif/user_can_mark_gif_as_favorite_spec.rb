require 'rails_helper'

describe "A user is logs in" do
  context "marks a gif as a favorite" do
    context "that gif is now located in their favorites" do

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      

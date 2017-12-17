require 'rails_helper'

describe Category do
  describe "validations" do
    it "is invalid without a name" do
      category = Category.new()

      expect(category).to be_invalid
    end

    it "is valid with a name" do
      category = Category.new(name: "dog")

      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.new(name: "dog")
      gif = Gif.new(image_path: "dog_path", category: category)

      expect(category).to respond_to(:gifs)
    end
  end
end

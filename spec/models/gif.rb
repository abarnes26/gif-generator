require 'rails_helper'

describe Gif do
  describe "validations" do
    it "is invalid without a an image_path" do
      gif = Gif.new()

      expect(gif).to be_invalid
    end

    it "is valid with an image_path" do
      gif = Gif.new(image_path: "dog")

      expect(gif).to be_valid
    end
  end

  describe "relationships" do
    it "belongs to a category" do
      category = Category.new(name: "dog")
      gif = Gif.new(image_path: "dog", category: category)

      expect(gif).to respond_to(:category)
    end
  end
end

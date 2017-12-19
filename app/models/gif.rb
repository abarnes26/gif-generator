class Gif < ApplicationRecord
  validates :image_path, presence: true, uniqueness: true
  belongs_to :category
  has_many :favorites, foreign_key :gif_id


  def self.generate(name)
    api_instance = GiphyClient::DefaultApi.new
    api_key = "dc6zaTOxFJmzC"
    q = name.gsub(' ', '+')
    opts = {limit: 1}
    begin
      result = api_instance.gifs_search_get(api_key, q, opts)
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end
    return result
  end

end



# connection = GiphyClient::DefaultApi.new
#   formatted_name = name.gsub(' ', '+')
#   request = "/v1/gifs/search?q=#{formatted_name}&api_key=dc6zaTOxFJmzC&limit=1"
#   result = api_instance.gifs_search_get(api_key, q, opts)
#   image_path = JSON.parse(response.body)['data'].first['images']['original']['url']
#   if image_path
#      category = Category.find_by(name: name)
#      Gif.new(image_path: image_path, category_id: category.id)
#   else
#     Gif.new
#   end
# end

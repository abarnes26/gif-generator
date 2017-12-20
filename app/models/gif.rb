class Gif < ApplicationRecord
  validates :image_path, presence: true, uniqueness: true
  belongs_to :category
  has_many :favorites


  def self.generate(name)
    api_instance = GiphyClient::DefaultApi.new
    api_key = "dc6zaTOxFJmzC"
    q = name.gsub(' ', '+')
    opts = {limit: 50}
    begin
      result = api_instance.gifs_search_get(api_key, q, opts)
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end
    return result
  end

end

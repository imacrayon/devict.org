require 'httparty'

class YouTube
  include HTTParty
  format :json

  # Disable SSL verification. I had this problem when I was doing local
  # development and I figure... meh?
  default_options.update(verify: false)
end

class Video < ActiveRecord::Base
  attr_accessible :ytID, :title, :author, :published_at

  def self.add ytID
    key = ENV["YT_KEY"]
    data = YouTube.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{ytID}&key=#{key}")
    snippet = data["items"][0]["snippet"]

    Video.create({
      :ytID         => ytID,
      :title        => snippet["title"],
      :author       => snippet["channelTitle"],
      :published_at => snippet["publishedAt"],
    })
  end

  def image
    "https://i.ytimg.com/vi/#{ytID}/hqdefault.jpg"
  end
end

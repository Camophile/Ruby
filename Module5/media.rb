class Clip
  attr_reader :comments
  
  def initialize
    @comments = []
  end

  def add_comment(comment)
    comments << comment
  end

  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  attr_accessor :resolution
end

class Song < Clip
  attr_accessor :beats_per_minute
end

video = Video.new
video.add_comment("cool vid")
video.add_comment("dope vid")
song = Song.new
song.add_comment("cool songo")

p video.comments, song.comments


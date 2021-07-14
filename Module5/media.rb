module AcceptsComments
  def comments
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end
end
class Clip
  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  include AcceptsComments
  attr_accessor :resolution
end

class Song < Clip
  include AcceptsComments
  attr_accessor :beats_per_minute
end

class Photo
  include AcceptsComments
  def show
    puts "Displaying #{object_id}"
  end
end

photo = Photo.new
photo.add_comment("neat photo")
p photo.comments
photo.show

video = Video.new
video.add_comment("cool vid")
video.add_comment("dope vid")
song = Song.new
song.add_comment("cool songo")

p video.comments, song.comments
video.play
song.play

p Photo.ancestors

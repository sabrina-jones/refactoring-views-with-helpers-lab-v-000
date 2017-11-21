class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    artist.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def display_artist(song)
   if song.artist == nil
     link_to "Add Artist", edit_song_path(song)
   else
      link_to song.artist_name, artist_path(song.artist)
   end
 end
end

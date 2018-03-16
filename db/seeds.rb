# Add seed data here. Seed your database with `rake db:seed`
require 'pry'
parser = LibraryParser.new
files = parser.files
songs = files.collect do |song|
  parser.parse_filename(song)
end


songs.each do |song|
  song_name = song[1]
  artist_name = song[0]
  genre_name = song[2]
  each_song = Song.create(name: song_name)
  each_genre = Genre.find_or_create_by(name: genre_name)
  each_artist = Artist.find_or_create_by(name: artist_name)

  each_artist.songs << each_song
  each_genre.songs << each_song

  #at this point, the song knows about its artist and the song knows about its genre
  song_array = each_genre.songs.select do |song|
    song.artist.name == each_artist.name
  end

  # each_genre.artists << each_artist
  # each_artist.genres << each_genre
end

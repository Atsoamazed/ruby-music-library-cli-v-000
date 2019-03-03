require 'pry'
class MusicLibraryController
  def initialize(path ='./db/mp3s') 
      MusicImporter.new(path).import
  end
  
  def call
     input = ' ' 
     until input == 'exit'
       puts "Welcome to your music library!"
       puts "To list all of your songs, enter 'list songs'."
       puts "To list all of the artists in your library, enter 'list artists'."
       puts "To list all of the genres in your library, enter 'list genres'."
       puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs of a particular genre, enter 'list genre'."
       puts "To play a song, enter 'play song'."
       puts "To quit, type 'exit'."
       puts "What would you like to do?"
        input = gets.strip
      
      
      case input
      when "list songs"
        list_songs 
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song 
      end
    end 
    
    def list_songs
      Song.all.sort_by(&:name).each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    end
    def list_artists
      Artist.all.sort_by(&:name).each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
    end
    def list_genres
      Genre.all.sort_by!(&:name).each.with_index(1) do |genres, song, i| 
       puts "#{i}. #{genres.name}"
      end
      
      end
end
end
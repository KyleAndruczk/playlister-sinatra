class RenameSongGenre < ActiveRecord::Migration[5.2]
  def change
    rename_table :songGenres, :song_genres
  end
end

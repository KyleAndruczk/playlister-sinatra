# Add seed data here. Seed your database with `rake db:seed`
Artist.destroy_all
Song.destroy_all
Genre.destroy_all
SongGenre.destroy_all
puts "everything destroyed"

10.times do
    Artist.create(name: Faker::Name.name)
end

10.times do
    Genre.create(name: Faker::Music.genre)
end

50.times do
    Song.create(name: Faker::Music.album, artist_id: Artist.ids.sample)
end

100.times do
    SongGenre.create(song_id: Song.ids.sample, genre_id: Genre.ids.sample)
end
puts "donee"



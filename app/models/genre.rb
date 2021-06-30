class Genre < ActiveRecord::Base
    has_many :songGenres
    has_many :songs, through: :songGenres
    has_many :artists, through: :songs
end 
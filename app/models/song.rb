class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :songGenres
    has_many :genres, through: :songGenres
end 

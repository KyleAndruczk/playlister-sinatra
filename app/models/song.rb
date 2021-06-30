class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :songGenres
    has_many :genres, through: :songGenres

    def slug 
        lowercase = self.name.downcase
        lowercase.split(" ").join('-')
    end

    def self.find_by_slug(slug)
        Song.all.find {|song| song.slug == slug}
    end
end 

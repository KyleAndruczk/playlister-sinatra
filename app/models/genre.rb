class Genre < ActiveRecord::Base
    has_many :songGenres
    has_many :songs, through: :songGenres
    has_many :artists, through: :songs

    def slug 
        lowercase = self.name.downcase
        lowercase.split(" ").join('-')
    end

    def self.find_by_slug(slug)
        Genre.all.find {|genre| genre.slug == slug}
    end
end 
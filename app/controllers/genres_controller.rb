class GenresController < ApplicationController
    get "/genres" do 
        @genres = Genre.all
        erb :"songs/index"
    end 

    get "/genres/:slug" do
        @song = Genre.find_by_slug
        erb :"genres/show"
    end
end
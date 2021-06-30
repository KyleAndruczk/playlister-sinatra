class SongsController < ApplicationController
    get "/songs" do 
        @songs = Song.all
        erb :"songs/index"
    end 

    get "/songs/new" do
        @genres=Genre.all
        erb :"songs/new"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    post "/songs" do
        song=Song.create(params[:song])
        params[:genres].each{
            |genre|
            SongGenre.create(song_id: song.id, genre_id: genre[:id])
        }

        redirect "/songs"
    end


end
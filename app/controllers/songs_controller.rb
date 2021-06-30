require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    get "/songs" do 
        @songs = Song.all
        erb :"songs/index"
    end 

    get "/songs/new" do
        @genres=Genre.all
        erb :"songs/new"
    end

    patch "/songs/:slug/edit" do

    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    post "/songs" do
        artist=Artist.find_by(name: params[:artist][:name])
        if(artist==nil)
            artist=Artist.create(params[:artist])
        end
        #binding.pry
        params[:song][:artist_id]=artist.id
        song=Song.create(params[:song])
        if(params[:genres]!=nil)
            params[:genres].each{
                |genre|
                SongGenre.create(song_id: song.id, genre_id: genre[:id])
            }
        end
        flash[:message] = "Successfully created song."

        redirect "/songs/#{song.slug}"
    end


end
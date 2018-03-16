class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all

    erb :"/songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"/songs/new"
  end

  get "/songs/:id" do
    @song = Song.find(params[:id])

    erb :"/songs/show"
  end

  post "/songs" do
    song = Song.create(name: params["song"]["name"])
    artist = Artist.find_or_create_by(name: params["song"]["artist_name"])
    genre = Genre.find(params["song"]["genre_ids"])
    song.artist_id = artist.id
    song.genres << genre
    song.save

    redirect "/songs"
  end

  get "/songs/:id/edit" do
    @genres = Genre.all
    @song = Song.find(params[:id])

    erb :"/songs/edit"
  end

end

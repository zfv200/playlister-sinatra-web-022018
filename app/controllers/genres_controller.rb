class GenresController < ApplicationController

    get "/genres" do
      @genres = Genre.all

      erb :"/genres/index"
    end

    get "/genres/:name" do
      @genre = Genre.find_by(name: params[:name])

      erb :"/genres/show"
    end
end

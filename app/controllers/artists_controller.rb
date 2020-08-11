class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    find_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.valid?
      @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age, :title)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

end

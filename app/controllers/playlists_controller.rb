class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  def index
    @playlist = Playlist.all
  end

  def show
    authorize @playlist
  end

  def new
    @playlist = Playlist.new
    authorize @playlist
  end

  def create
    authorize @playlist

    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

    authorize @playlist

    if @playlist.save
      redirect_to @playlist, notice: "Your Playlist was successfully created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    authorize @playlist
  end

  def update
    authorize @playlist
  end

  def destroy
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end

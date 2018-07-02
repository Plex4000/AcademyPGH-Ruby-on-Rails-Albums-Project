class SongsController < ApplicationController
    def new
        @album = Album.find(params[:album_id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @album = Album.find(params[:album_id])
        @song = @album.songs.create(song_params)
        redirect_to album_path(@album)
      end

      def destroy
        @album = Album.find(params[:album_id])
        @song = @album.songs.find(params[:id])
        @song.destroy
        redirect_to album_path(@album)
      end

      def update
        @album = Album.find(params[:album_id])
        @song = @album.songs.find(params[:id])
        @song.update(song_params)
        redirect_to album_path(@album)
      end

      private
    def song_params
      params.require(:song).permit(:title, :duration)
    end

end

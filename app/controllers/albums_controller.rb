class AlbumsController < ApplicationController
    
    def index
        @albums = Album.all
        albumbscount = @albums.select('title').count
        if(albumbscount == 0)
            render 'noalbums'
        end
    end

    def show
        @album = Album.find(params[:id])
    end

    def new
        @album = Album.new
    end

    def edit
        @album = Album.find(params[:id])
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to @album
        else
            render 'new'   
        end 
    end

    def update
        @album = Album.find(params[:id])
       
        if @album.update(album_params)
          redirect_to @album
        else
          render 'edit'
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to albums_path
    end

    def noalbums

    end

    private
    def album_params
        params.require(:album).permit(:title, :artist)
    end

end

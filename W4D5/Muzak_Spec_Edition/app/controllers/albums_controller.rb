class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    @album = Album.new(user_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def edit

  end

  def update
  end

  def destroy
  end

end

class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: :index

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:success] = 'Image created'
      redirect_to @image
    else
      render :new
    end
  end

  def update
    if @image.update(image_params)
      flash[:success] = 'Image updated'
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    flash[:success] = 'Image deleted'
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :file)
    end
end

class Entertainers::ImagesController < ApplicationController
  def index
    build_params = params.permit(:entertainer_id)
    @images = Entertainer.find(build_params[:entertainer_id]).images
    render json: @images
  end

  def show
    build_params = params.permit(:entertainer_id, :id)
    @image = Entertainer.find(build_params[:entertainer_id]).images.find(build_params[:id])
    send_file "#{Rails.root}/public/images/#{@image.path}.jpg", :type => "image/jpg", :disposition => "inline"
  end

  def search
    # TODO
  end
end

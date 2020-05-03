class Entertainers::ImagesController < ApplicationController
  def index
    build_params = params.permit(:entertainer_id)
    @images = Entertainer.find(build_params[:entertainer_id]).images
    # TODO: どう返すか考える
    render json: @images.map(&:id)
  end

  def show
    build_params = params.permit(:entertainer_id, :id)
    @image = Entertainer.find(build_params[:entertainer_id]).images.find(build_params[:id])
    send_file "#{Rails.root}/public/images/#{@image.path}.#{@image.file_type}", type: "image/#{@image.file_type}", :disposition => "inline"
  end

  def search
    # TODO
  end
end

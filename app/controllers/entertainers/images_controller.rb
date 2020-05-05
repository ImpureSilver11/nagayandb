# frozen_string_literal: true

class Entertainers::ImagesController < ApplicationController
  def index
    build_params = params.permit(:entertainer_id)
    @images = Entertainer.find(build_params[:entertainer_id]).images
    # TODO: どう返すか考える
    render json: @images.map { |i| { file: i.presigned_url } }
  end

  def show
    build_params = params.permit(:entertainer_id, :id)
    @image = Entertainer.find(build_params[:entertainer_id]).images.find(build_params[:id])
    pp @image.presigned_url
    render json: { file: @image.presigned_url}
  end

  def create
    file_path = "#{Rails.root}/public/images/4.jpg"
    pp file_path

    render json: { file: file_path }
  end

  def search
    # TODO
  end
end

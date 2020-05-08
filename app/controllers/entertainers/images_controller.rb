# frozen_string_literal: true
class Entertainers::ImagesController < ApplicationController
  def index
    build_params = params.permit(:entertainer_id)
    @images = Entertainer.find(build_params[:entertainer_id]).images
    # TODO: どう返すか考える
    render json: @images.map { |i| { id: i.id, file: i.presigned_url } }
  end

  def show
    build_params = params.permit(:entertainer_id, :id)
    @image = Entertainer.find(build_params[:entertainer_id]).images.find(build_params[:id])
    pp @image.presigned_url
    render json: { file: @image.presigned_url }
  end

  def create
    build_params = params.permit(:entertainer_id, :title, :image)
    @image = Entertainer.find(build_params[:entertainer_id]).images.new
    @image.title= build_params[:title]
    @image.path = build_params[:image]
    @image.save!
    render json: { status: 200, code: 200, message: 'done' }
  rescue StandardError => e
    pp e
    pp e.message
    render json: { status: 500, code: 500, message: e.message }
  end

  def search
    # TODO
  end

end

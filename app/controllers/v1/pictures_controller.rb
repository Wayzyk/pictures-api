class V1::PicturesController < ApplicationController
  def create
    @picture = current_user.pictures.create(picture_params)
    if @picture.save!
      render json: @picture.as_json, status: 200
    else
      render json: { errors: "ololo" }, status: 422
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
  end

  private

  def picture_params
    params.permit(:image)
  end
end

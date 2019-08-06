# frozen_string_literal: true

module V1
  class PicturesController < ApiController
    def index
      render_json data: { pictures: crop_pictures(@user.pictures) }
    end

    def create
      begin
        encoded_file = Base64.decode64(params[:file][:file64])
        picture = MiniMagick::Picture.read(encoded_file)
      rescue MiniMagick::Invalid
        render_json error: [{ code: 'BROKEN_PICTURE', message: "Picture can't be decoded" }],
                    status: 400
        return
      end

      picture.write("tmp/#{params[:file][:filename]}")
      picture_file = File.open("tmp/#{params[:file][:filename]}")
      begin
        saved_picture  = Picture.create!(height: params[:height].to_i,
                          width: params[:width].to_i,
                          user: @user,
                          original_picture: picture_file)
      rescue Mongoid::Errors::Validations => e
        render_json error: [{ code: 'BAD_PARAMETER', message: e.summary }],
                            status: 422
        return
      end
      File.delete(picture_file.path)
      render_json data: { picture_link: full_picture_url(saved_picture) }
    end

    def update
      picture = Picture.find_by(id: params[:id])
      if picture.nil?
        render_json error: [{ code: 'PICTURE_NOT_FOUND', message: "Picture can't be found" }],
            status: 404
        return
      end
      begin
        picture.update!(height: params[:height].to_i,
                      width: params[:width].to_i)
      rescue Mongoid::Errors::Validations => e
        render_json error: [{ code: 'BAD_PARAMETER', message: e.summary }],
                            status: 422
        return
      end
      render_json data: { picture_link: full_picture_url(picture) }
    end

    def render_original_picture
      render_picture(original_picture)
    end

    def render_scaled_picture
      render_picture(scaled_picture)
    end

    private

      def original_picture
        Picture.find(params[:id])&.original_picture
      end

      def scaled_picture
        original_picture&.scaled
      end

      def render_picture(picture)
        content = picture.read
        if stale?(etag: content, public: true)
          send_data content, type: picture.file.content_type, disposition: 'inline'
          expires_in 0, public: true
        end
      end

      def crop_pictures(pictures)
        pictures.map do |picture|
          {
            id: picture.id.to_s,
            height: picture.height,
            width: picture.width,
            link: full_picture_url(picture)
          }
        end
      end

      def full_picture_url(picture)
        root_url + 'v1/picture' + picture.picture_url
      end
    end
  end
end

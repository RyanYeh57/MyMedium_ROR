class Api::UtilsController < Api::BaseController
  IMAGE_EXT = [".git", ".jpeg", ".png", ".jpg", ".svg"]
  def upload_image
    f = params[:file]
    ext = File.extname(f.original_filename) 
    raise "格式錯誤!" unless IMAGE_EXT.include?(ext) #如果不在名單內無法上傳

    blob = ActiveStorage::Blob.create_after_upload!(
      io: f,
      filename: f.original_filename,
      content_type: f.content_type 
    )

    render json: { link: url_for(blob) }
  end
end
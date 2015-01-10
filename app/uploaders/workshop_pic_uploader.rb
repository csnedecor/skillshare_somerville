class WorkshopPicUploader < CarrierWave::Uploader::Base
  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :full do
    process resize_to_fill: [500, 500]
  end
end

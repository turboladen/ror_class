json.array!(@photos) do |photo|
  json.extract! photo, :file_name, :path
  json.url photo_url(photo, format: :json)
end

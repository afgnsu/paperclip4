json.array!(@downloads) do |download|
  json.extract! download, :id, :upload
  json.url download_url(download, format: :json)
end

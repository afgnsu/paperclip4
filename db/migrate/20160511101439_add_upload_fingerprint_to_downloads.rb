class AddUploadFingerprintToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :upload_fingerprint, :string
  end
end

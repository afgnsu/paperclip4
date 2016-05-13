class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.attachment :upload

      t.timestamps null: false
    end
  end
end

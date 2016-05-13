class Download < ActiveRecord::Base

  Paperclip.interpolates :year do |attachment, style|
    attachment.instance.created_at.year
  end

  Paperclip.interpolates :month do |attachment, style|
    attachment.instance.created_at.month.to_s.rjust(2,'0')
  end


   has_attached_file :upload,
     #styles: { medium: '300x300>', thumb: '100x100>' },
     styles:  { :public => ['640x640>', :jpg] , :view => ['360x360>', :jpg] , :cover => ['180x180>', :jpg], :thumb => ['80x80#', :jpg]},

     url: '/uploads/:year/:month/:style/:id_:fingerprint.:extension',
     path: ':rails_root/public/uploads/:year/:month/:style/:id_:fingerprint.:extension',
     default_url: "/images/:style/missing.png"

   validates_attachment :upload, content_type: { content_type: /\Aimage\/.*\Z/ }, size: { in: 0..1.megabytes }, file_type_ignorance: true
   validates :upload, presence: true

   before_post_process :resize_images

   def image?
     upload_content_type =~ /\Aimage\/.*\Z/
   end

   private
   def resize_images
     return false unless image?
   end
end

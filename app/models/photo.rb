class Photo < ActiveRecord::Base
  has_attached_file :asset, 
    :path            => ":rails_root/public/uploads/:attachment/:id/:style/:basename.:extension",
    :url             => "/uploads/:attachment/:id/:style/:basename.:extension",
    :default_url     => "/images/:attachment/missing_:style.gif",
    :convert_options => { :thumb => "-strip" },
    :styles          => { :thumb => "150>"}

  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 10.megabytes
  validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg']

  # attr_accessible :title, :body, :asset

end

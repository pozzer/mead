class Picture < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
  belongs_to :user

  has_attached_file :picture, styles: { medium: "300x300>", cover_hd: "900x900>", thumb: "100x100>", avatar: "128x128#" }, default_url: "images/:style/missing.png"

  enum picture_type: { image: 0, avatar: 1, cover: 2 }

	validates_attachment_size :picture, :less_than => 1.megabytes
	validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']

end

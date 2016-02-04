class Picture < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
  belongs_to :user

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  enum picture_type: { image: 0, avatar: 1, cover: 2 }
end

class Bottle < ActiveRecord::Base
	has_many :pictures, :as => :attachable, :dependent => :destroy
	has_one :image, -> { where picture_type: 0 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_many :bottle_trades
	belongs_to :user

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  def image_url
    image.picture.url if image
  end


end

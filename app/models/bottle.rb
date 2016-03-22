class Bottle < ActiveRecord::Base

  has_many :pictures, :as => :attachable, :dependent => :destroy
  has_many :ratings, :as => :rateable, :dependent => :destroy
	has_one :image, -> { where picture_type: 0 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_many :bottle_trades
	belongs_to :user

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  scope :random_order, -> {order('DBMS_RANDOM.VALUE')}

  def image_url
    return image.picture.url if image
    "bottle.jpg"
  end

  def to_s
    label
  end


end

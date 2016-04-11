class Bottle < ActiveRecord::Base

  has_many :pictures, :as => :attachable, :dependent => :destroy
  has_many :ratings, :as => :rateable, :dependent => :destroy
	has_one :image, -> { where picture_type: 0 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_many :bottle_trades
	belongs_to :user

	acts_as_taggable
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  scope :publics, -> { where(private: false) }
  scope :random_order, -> { order('DBMS_RANDOM.VALUE')}

  scope :joins_search, -> { publics.joins("INNER JOIN users ON users.id = bottles.user_id 
                                           INNER JOIN profiles ON users.id = profiles.user_id") }

  def image_url
    return image.picture.url if image
    "bottle.jpg"
  end

  def to_s
    label
  end

  def self.columns_search
    ["bottles.label", "bottles.style", "bottles.organization_name",
    "profiles.first_name || ' ' || profiles.last_name"]
  end


end

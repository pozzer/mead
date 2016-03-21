class Profile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

	belongs_to :user
	belongs_to :city
	has_many :pictures, :as => :attachable, :dependent => :destroy
  has_many :ratings, :as => :rateable, :dependent => :destroy
  has_one :avatar, -> { where picture_type: 1 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_one :cover, -> { where picture_type: 2 }, as: :attachable, class_name: "Picture", :dependent => :destroy

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :first_name, presence: true
  validates :birth_date, presence: true
  validates :birth_date, major_age: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    if avatar
      avatar.picture.url 
    else
      "missing.png"
    end
  end

  def cover_url
    cover.picture.url if cover
  end

  def reputation
    ratings.any? ? (ratings.map(&:score).sum/ratings.size).to_i : 0
  end

  def city_name
    city ? city.name : "Não informado"
  end

end

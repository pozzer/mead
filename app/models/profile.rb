class Profile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

	belongs_to :user
	belongs_to :city
	has_many :pictures, :as => :attachable, :dependent => :destroy
  has_many :ratings, :as => :rateable, :dependent => :destroy
  has_many :avatars, -> { where picture_type: 1 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_many :covers, -> { where picture_type: 2 }, as: :attachable, class_name: "Picture", :dependent => :destroy
  has_one :address, dependent: :destroy

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => proc { |attributes| attributes['picture'].blank? }
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :user

  validates :first_name, presence: true
  validates :birth_date, presence: true, major_age: true

  scope :joins_search, -> { joins("LEFT JOIN addresses ON addresses.profile_id = profiles.id
                             LEFT JOIN cities ON addresses.city_id = cities.id
                             LEFT JOIN states ON addresses.state_id = states.id") }

  paginates_per 3

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar
    avatars.last
  end

  def avatar_url
    if avatar
      avatar.picture.url
    else
      "missing.png"
    end
  end

  def cover
    covers.last
  end

  def cover_url
    if cover
      covers.last.picture.url
    else
      "missing_cover.png"
    end
  end

  def reputation
    ratings.any? ? (ratings.map(&:score).sum/ratings.size).to_i : 0
  end

  def city_and_symbol
    unless address.nil?
      return [address.city.name, address.state.symbol]
    else
      return ["Não informado", "-"]
    end
  end


  def self.columns_search
    ["profiles.first_name", "profiles.last_name", "profiles.about", "profiles.organization_name",
     "addresses.street", "addresses.district",
     "states.name",
     "cities.name"]
  end

end

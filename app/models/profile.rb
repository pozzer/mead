class Profile < ActiveRecord::Base

	belongs_to :user
	belongs_to :city
	has_many :pictures, :as => :attachable, :dependent => :destroy

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  def full_name
    "#{first_name} #{last_name}"
  end

end

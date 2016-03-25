class Address < ActiveRecord::Base
  belongs_to :profile
  validates :postal_code, :state, :city, :street, :district, :number, presence: true
  belongs_to :city
  belongs_to :state
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :email
  #mount_uploader :image, ImageUploader
  #has_many :authorizations
  has_many :trades
  has_many :questions
  has_many :answers
  has_many :bottles
  has_many :bottle_trades
  has_many :trades
  has_many :messages, class_name: "MessageTrade"
  has_many :avaliations, class_name: "AvaliationTrade"
  has_many :pictures
  has_one :profile

  has_reputation :karma,
      :source => [
          { :reputation => :questioning_skill, :weight => 0.8 },
          { :reputation => :answering_skill }]

  has_reputation :questioning_skill,
      :source => { :reputation => :votes, :of => :questions }

  has_reputation :answering_skill,
      :source => { :reputation => :avg_rating, :of => :answers }
   

#  def self.new_with_session(params,session)
#    if session["devise.user_attributes"]
#      new(session["devise.user_attributes"],without_protection: true) do |user|
#        user.attributes = params
#        user.valid?
#      end
#    else
#      super
#    end
#  end
#
#  def self.from_omniauth(auth, current_user)
#    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
#    if authorization.user.blank?
#      user = current_user || User.where('email = ?', auth["info"]["email"]).first
#      if user.blank?
#       user = User.new
#       user.password = Devise.friendly_token[0,10]
#       user.name = auth.info.name
#       user.email = auth.info.email
#       if auth.provider == "twitter"
#         user.save(:validate => false)
#       else
#         user.save
#       end
#     end
#     authorization.username = auth.info.nickname
#     authorization.user_id = user.id
#     authorization.save
#   end
#   authorization.user
# end
end

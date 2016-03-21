class User < ActiveRecord::Base

  has_one :profile
  has_many :trades_received, foreign_key: "negotiator_id", class_name: "Trade"
  has_many :trade_requests, foreign_key: "negotiant_id", class_name: "Trade"
  has_many :questions
  has_many :answers
  has_many :bottles
  has_many :bottle_trades
  has_many :trades
  has_many :messages, class_name: "MessageTrade"
  has_many :avaliations, class_name: "AvaliationTrade"
  has_many :pictures
  has_many :favorite_questions
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_many :conversations, :foreign_key => :sender_id

  accepts_nested_attributes_for :profile

  after_initialize :initialize_profile

  has_reputation :questioning_skill, source: { reputation: :votes, of: :questions }
  has_reputation :answering_skill, source: { reputation: :votes, of: :answers }
  has_reputation :best_answering_skill, source: { reputation: :best_votes, of: :answers }
  has_reputation :favorite_question_skill, source: { reputation: :favorite_question, of: :questions }

  has_reputation :experience,
      source: [{ reputation: :questioning_skill, weight: 0.8 },
               { reputation: :answering_skill, weight: 0.5 },
               { reputation: :best_answering_skill, weight: 1 },
               { reputation: :favorite_question_skill, weight: 1 }]




  devise :database_authenticatable, :registerable, :lockable,
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook] 
    # :confirmable, :lockable, :timeoutable and :omniauthable

  default_scope -> { includes(:profile) }

  validates_presence_of :email, :password
  validates_acceptance_of :terms, :allow_nil => false, :on => :create
  #validates_acceptance_of :terms, on: :create, :message => "must be abided"
  
  attr_accessor :terms 

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first || User.where(:email=> auth.info.email).first
    unless user
      user = User.create(provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20])
      user.profile.attributes={first_name: auth.extra.raw_info.first_name, last_name: auth.extra.raw_info.last_name}
      user.save
    else
      user.update_attributes({:provider => auth.provider, :uid => auth.uid}) if user.provider.blank? or user.uid.blank?
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

  def full_name
    profile.full_name
  end
  alias_method :name, :full_name

  def first_name
    profile.first_name
  end

  def favorite_question(question)
    favorite_questions.where(question: question).first
  end

  def get_experience
    reputation_for(:experience)
  end

  private
    def initialize_profile
      self.profile = self.build_profile if self.profile.nil?
    end

end

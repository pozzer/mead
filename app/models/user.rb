class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :email

  has_many :trades
  has_many :questions
  has_many :answers
  has_many :bottles
  has_many :bottle_trades
  has_many :trades
  has_many :messages, class_name: "MessageTrade"
  has_many :avaliations, class_name: "AvaliationTrade"
  has_many :pictures
  has_many :favorite_questions

  has_one :profile

  has_reputation :karma,
      :source => [
          { :reputation => :questioning_skill, :weight => 0.8 },
          { :reputation => :answering_skill }]

  has_reputation :questioning_skill,
      :source => { :reputation => :votes, :of => :questions }

  has_reputation :answering_skill,
      :source => { :reputation => :avg_rating, :of => :answers }
   
end

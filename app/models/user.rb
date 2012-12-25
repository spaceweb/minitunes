class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :profile_name

  validates :name, presence: true
  validates :profile_name, presence: true,
                          uniqueness: true,
                          format: {
                            with: /a-zA-Z0-9_-/,
                            message: "Must be formatted correctly."
                          }
  has_many :reviews
  has_many :artists, :through => :review
  has_many :friends, :dependent => :destroy
  has_many :users, :through => :friend
  has_many :adds, :dependent => :destroy
  has_many :artists, :through => :add
  # attr_accessible :title, :body
end

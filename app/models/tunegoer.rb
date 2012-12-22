class Tunegoer < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  attr_accessible :uid, :provider, :name
  
  has_many :reviews
  has_many :artists, :through => :review
  has_many :friends, :dependent => :destroy
  has_many :tunegoers, :through => :friend
  has_many :tienes, :dependent => :destroy
  has_many :artists, :through => :tiene
  
  def self.create_with_omniauth(auth)
    Tunegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end
